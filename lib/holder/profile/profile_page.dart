import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/round_icon_button .dart';
import '../../model/user.dart';

class ProfilePage extends StatelessWidget {
  final User user;

  const ProfilePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(user.backgroundImage),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Spacer(),
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(user.backgroundImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(user.name,
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              SizedBox(height: 5),
              Text(user.intro,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  maxLines: 1),
              SizedBox(height: 20),
              Divider(color: Colors.white),
              if (user.name == me.name)
                _buildMyIcons()
              else
                _buildFriendIcons(),
            ],
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(FontAwesomeIcons.times, size: 30, color: Colors.white),
            ),
            actions: [
              const RoundIconButton(icon: FontAwesomeIcons.gift),
              const SizedBox(width: 15),
              const RoundIconButton(icon: FontAwesomeIcons.cog),
              const SizedBox(width: 20),
            ],
          )),
    );
  }

  Widget _buildMyIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomIconButton(
            icon: FontAwesomeIcons.comment,
            text: "나와의 채팅",
          ),
          SizedBox(
            width: 50,
          ),
          BottomIconButton(
            icon: FontAwesomeIcons.pen,
            text: "프로필 편집",
          ),
        ],
      ),
    );
  }

  Widget _buildFriendIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BottomIconButton(
          icon: FontAwesomeIcons.comment,
          text: "1:1채팅",
        ),
        SizedBox(
          width: 50,
        ),
        BottomIconButton(
          icon: FontAwesomeIcons.phone,
          text: "통화하기",
        ),
      ],
    );
  }
}

class BottomIconButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const BottomIconButton({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 25,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
