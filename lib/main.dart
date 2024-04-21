import 'package:flutter/material.dart';
import 'package:flutter_recipe01/size.dart';
import 'package:flutter_recipe01/validatePassword.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white, // 텍스트 색상을 지정하는 속성
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            minimumSize: Size(400, 60),
          ),
        ),
      ),
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: ElevatedButton(
          child: Text("move login page"),
          onPressed: () {
            Navigator.pushNamed(context, "/login");
          },
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          "assets/images/logo.svg",
          height: 70,
          width: 70,
        ),
        Text(
          "${title}",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: xlargeGap),
          Logo(title: "loging"),
          CustomForm(),
        ],
      ),
    );
  }
}

class CustomForm extends StatelessWidget {
  final email = TextEditingController(); // 값을 분석
  final password = TextEditingController(); // 값을 분석
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: email,
            text: "Email",
            validator: (value) {
              print("value : ${value}");

              if (value!.isEmpty) {
                return "비어있을수 없습니다";
              } else {
                return null; // 정상일때 null을 리턴한다.
              }
            },
          ),
          SizedBox(height: mediumGap),
          CustomTextFormField(
            controller: password,
            text: "password",
            validator: validatePassword(),
          ),
          SizedBox(height: largeGap),
          TextButton(
            onPressed: () {
              //print("email: ${email.text}");
              if (formkey.currentState!.validate()) {
                Navigator.pushNamed(context, "/home");
                // validator를 호출
                print("유효성 통과 ===================");
              }
            },
            child: Text("Login"),
          )

        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final text;
  final controller;
  final obscureText;
  final validator;

  const CustomTextFormField({
    required this.text,
    required this.controller,
    this.obscureText =false,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${text}"),
        TextFormField(
          obscureText: obscureText,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            hintText: "Enter ${text}",
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
        )

      ],
    );
  }
}
