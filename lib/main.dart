import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe01/constants.dart';
import 'package:flutter_recipe01/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: ShoppingCartPage(),
    );
  }
}

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [ShoppingCartHeader(), ShoppingCartDetail()],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 1.0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        SizedBox(width: 16),
      ],
    );
  }
}

class ShoppingCartDetail extends StatelessWidget {
  const ShoppingCartDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            _buildDetailNameAndPrice(),
            _buildDetailRatingAndReviewCount(),
            _buildDetailColorOptions(),
            _buildDetailButton(context)
          ],
        ),
      ),
    );
  }

  Widget _buildDetailButton(BuildContext context) {
    return Align(
      child: TextButton(
        onPressed: () {
          showCupertinoDialog(
            // 1. 추가
            context: context,
            builder: (context) =>
                CupertinoAlertDialog(
                  title: Text("장바구니에 담으시겠습니까?"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("확인", style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: kAccentColor,
          minimumSize: Size(300, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          "Add to Cart",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

Widget _buildDetailColorOptions() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color Options"),
        SizedBox(height: 10),
        Row(
          children: [
            _buildDetailIcon(Colors.black),
            _buildDetailIcon(Colors.green),
            _buildDetailIcon(Colors.orange),
            _buildDetailIcon(Colors.grey),
            _buildDetailIcon(Colors.white),
          ],
        ),
      ],
    ),
  );
}

Widget _buildDetailIcon(Color color) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Stack(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
            shape: BoxShape.circle,
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: ClipOval(
            child: Container(
              color: color,
              width: 40,
              height: 40,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildDetailRatingAndReviewCount() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      children: [
        Icon(Icons.star, color: Colors.yellow),
        Icon(Icons.star, color: Colors.yellow),
        Icon(Icons.star, color: Colors.yellow),
        Icon(Icons.star, color: Colors.yellow),
        Icon(Icons.star, color: Colors.yellow),
        Spacer(),
        Text("review "),
        Text("(26)", style: TextStyle(color: Colors.blue))
      ],
    ),
  );
}

Widget _buildDetailNameAndPrice() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Urban Soft AL 10.0",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "\$699",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}

////////////////////////////////

class ShoppingCartHeader extends StatefulWidget {
  const ShoppingCartHeader({super.key});

  @override
  State<ShoppingCartHeader> createState() => _ShoppingCartHeaderState();
}

class _ShoppingCartHeaderState extends State<ShoppingCartHeader> {
  int selectedId = 0;

  List<String> selectedPic = [
    "assets/images/p1.jpeg",
    "assets/images/p2.jpeg",
    "assets/images/p3.jpeg",
    "assets/images/p4.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_buildHeaderPic(), _buildHeaderSelector()],
    );
  }

  Widget _buildHeaderSelector() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 30, left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildHeaderSelectorButton(0, Icons.directions_bike),
          _buildHeaderSelectorButton(1, Icons.motorcycle),
          _buildHeaderSelectorButton(2, CupertinoIcons.car_detailed),
          _buildHeaderSelectorButton(3, CupertinoIcons.airplane),
        ],
      ),
    );
  }

  Widget _buildHeaderPic() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AspectRatio(
          aspectRatio: 5 / 3,
          child: Image.asset(selectedPic[selectedId], fit: BoxFit.cover)),
    );
  }

  // 1. 다른 화면에서도 재사용하면 공통 컴포넌트 위젯으로 관리하는 것이 좋다.
  Widget _buildHeaderSelectorButton(int id, IconData mIcon) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: id == selectedId ? kAccentColor : kSecondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: Icon(mIcon, color: Colors.black),
        onPressed: () {
          setState(() {
            selectedId = id;
          });
        },
      ),
    );
  }
}
