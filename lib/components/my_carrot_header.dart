import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe01/holder/main_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme.dart';

class MyCarrotHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      elevation: 0.5,
      shadowColor: Colors.green,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            _buildProfileRow(),
            const SizedBox(height: 30),
            _buildProfileButton(),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRoundTextButton('판매내역', FontAwesomeIcons.receipt,context),
                _buildRoundTextButton('구매내역', FontAwesomeIcons.shoppingBag,context),
                _buildRoundTextButton('관심목록', FontAwesomeIcons.heart,context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow() {
    return Row(
      children: [
        Stack(
          children: [
            SizedBox(
              width: 65,
              height: 65,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.5),
                child: Image.network(
                  'https://picsum.photos/200/100', // :TODO 04 사진수정
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[100]),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 15,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('developer', style: textTheme().displayMedium), // :TODO 04수정
            SizedBox(height: 10),
            Text('좌동 #00912'),
          ],
        )
      ],
    );
  }

  Widget _buildProfileButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Container(
        height: 45,
        child: Center(
          child: Text(
            '프로필 보기', // :TODO 04수정 (오타)
            style: textTheme().titleMedium, // :TODO 04수정
          ),
        ),
      ),
    );
  }

  Widget _buildRoundTextButton(String title, IconData iconData,BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => MainPage(),
            ));
      },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: const Color.fromRGBO(255, 226, 208, 1),
                border: Border.all(color: Color(0xFFD4D5DD), width: 0.5)),
            child: Icon(
              iconData,
              color: Colors.orange,
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: textTheme().titleMedium, // :TODO 04수정
          )
        ],
      ),
    );
  }
}
