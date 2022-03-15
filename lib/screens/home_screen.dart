import 'package:flutter/material.dart';
import 'package:supplement_memo/parts/button.dart';

import 'memo_list_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                  "assets/images/https___freeillust-classic.com_wp-content_uploads_0203020022.png"),
            ),
            _titleText(),
            SizedBox(height: 8.0),
            Button(
              onPressed: () => _memoListScreen(context),
              icon: Icon(Icons.playlist_add_outlined),
              label: "メモリスト",
              color: Colors.green,
            ),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  Widget _titleText() {
    return Column(
      children: [
        Text(
          "サプメモ",
          style: TextStyle(fontSize: 100.0, fontFamily: "Pupupu"),
        ),
        Text(
          "サプリメント管理メモ",
          style: TextStyle(fontSize: 24.0),
        ),
      ],
    );
  }

  _memoListScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MemoListScreen()));
  }
}
