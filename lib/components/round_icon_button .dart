import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../holder/profile/profile_page.dart';
import '../model/user.dart';
class RoundIconButton extends StatelessWidget {
  final IconData icon;

  const RoundIconButton({
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2, color: Colors.white),
      ),
      child: Icon(icon,size: 17,color: Colors.white),
    );
  }
}
