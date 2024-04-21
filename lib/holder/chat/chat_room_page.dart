import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../../components/chat_Icon_botton.dart';
import '../../components/my_chat.dart';
import '../../components/other_chat.dart';
import '../../components/time_line.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({super.key});

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final List<MyChat> chats = [];
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFb2c7da),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "홍길동",
            style: Theme
                .of(context)
                .textTheme
                .headlineLarge,
          ),
          actions: [
            const Icon(FontAwesomeIcons.search, size: 20),
            const SizedBox(width: 25),
            const Icon(FontAwesomeIcons.bars, size: 20),
            const SizedBox(width: 25),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      TimeLine(time: "2021년 1월 1일 금요일"),
                      OtherChat(
                        name: "홍길동",
                        text: "새해 복 많이 받으세요.",
                        time: "오전 10:10",
                      ),
                      MyChat(
                        text: "선생님도 많이 받으십시오.",
                        time: "오후 2:15",
                      ),
                      ...List.generate(chats.length, (index) => chats[index]),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                height: 60,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: TextField(
                          controller: _textController,
                          maxLines: 1,
                          style: TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          onSubmitted: _handleSubmitted,
                        ),
                      ),
                    ),
                    ChatIconButton(icon: Icon(FontAwesomeIcons.smile)),
                    ChatIconButton(icon: Icon(FontAwesomeIcons.cog)),
                  ],
                )
            )
          ],
        ),

      ),
    );
  }

  void _handleSubmitted(text) {
    _textController.clear();
    setState(() {
      chats.add(MyChat(
          text: text,
          time: DateFormat("a K:m")
              .format(DateTime.now())
              .replaceAll("AM", "오전")
              .replaceAll("PM", "오후")
      ));
    });
  }
}
