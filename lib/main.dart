import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipePage(),
    );
  }
}

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildRecipeAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            buildRecipeTitle(),
            buildRecipeMenu(),
            buildRecipeListItem("버거", "burger"),
            buildRecipeListItem("버거", "burger"),
            buildRecipeListItem("버거", "burger"),
            buildRecipeListItem("버거", "burger"),
          ],
        ),
      ),
    );
  }

  Widget buildRecipeListItem(String title, final String image) {
    return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 2 / 1,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/images/${image}.jpeg",
                          fit: BoxFit.cover)),
                ),
                Text(
                  "${title}",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  "내용내용내용내용내용내용내용내용내용내용내용내용내용내용",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            ),
          );
  }

  Widget buildRecipeMenu() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildMenuItem(Icons.food_bank, "Home"),
          buildMenuItem(Icons.food_bank, "Home"),
          buildMenuItem(Icons.food_bank, "Home"),
          buildMenuItem(Icons.food_bank, "Home"),
        ],
      ),
    );
  }

  Widget buildMenuItem(IconData mIcon, String text) {
    return Container(
      width: 50,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(mIcon, color: Colors.redAccent, size: 30),
          SizedBox(height: 5),
          Text("${text}", style: TextStyle(color: Colors.black87)),
        ],
      ),
    );
  }

  Padding buildRecipeTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        "Recipe Title",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }

  AppBar _buildRecipeAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 5.0,
      actions: [
        Icon(CupertinoIcons.search, color: Colors.black),
        SizedBox(width: 15),
        Icon(CupertinoIcons.heart, color: Colors.black),
        SizedBox(width: 15),
      ],
    );
  }
}
