import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supplement_memo/db/database.dart';
import 'package:supplement_memo/screens/memo_list_screen.dart';

import '../main.dart';

enum EditStatus { ADD, EDIT }

class EditScreen extends StatefulWidget {
  final EditStatus status;
  final Memo? memo;

  EditScreen({required this.status, this.memo});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController supplementNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController bestBeforeController = TextEditingController();

  String _titleText = "";

  bool _isSupplementNameEnabled = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.status == EditStatus.ADD) {
      _isSupplementNameEnabled = true;
      _titleText = "新しいメモの追加";
      supplementNameController.text = "";
      quantityController.text = "";
      bestBeforeController.text = "";
    } else {
      _isSupplementNameEnabled = false;
      _titleText = "登録したメモの修正";
      supplementNameController.text = widget.memo!.supplementName;
      quantityController.text = widget.memo!.quantity;
      bestBeforeController.text = widget.memo!.bestBefore;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _backToMemoListScreen(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(_titleText),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => _onRegisteredMemo(),
              icon: Icon(Icons.done),
              tooltip: "登録",
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              Center(
                child: Text(
                  "サプリの名前,用量,賞味期限を入力して登録してください",
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              //サプリの名前を入力する
              _supplementNameInputPart(),
              SizedBox(
                height: 15.0,
              ),
              //用量を入力する
              _quantityInputPart(),
              SizedBox(
                height: 15.0,
              ),
              _bestBeforeInputPart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _supplementNameInputPart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          Text(
            "サプリの名前",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            enabled: _isSupplementNameEnabled,
            controller: supplementNameController,
            keyboardType: TextInputType.text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30.0),
          )
        ],
      ),
    );
  }

  Widget _quantityInputPart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          Text(
            "用量",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            controller: quantityController,
            keyboardType: TextInputType.text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30.0),
          )
        ],
      ),
    );
  }

  Future<bool> _backToMemoListScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MemoListScreen()));
    return Future.value(false);
  }

  Widget _bestBeforeInputPart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          Text(
            "賞味期限",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            controller: bestBeforeController,
            keyboardType: TextInputType.text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30.0),
          )
        ],
      ),
    );
  }

  _onRegisteredMemo() {
    if (widget.status == EditStatus.ADD) {
      _insertMemo();
    } else {
      _upDateWord();
    }
  }

  _insertMemo() async {
    if (supplementNameController.text == "" ||
        quantityController.text == "" ||
        bestBeforeController.text == "") {
      Fluttertoast.showToast(
          msg: "サプリの名前,用量,賞味期限の３つ全てを入力してください", toastLength: Toast.LENGTH_LONG);
      return;
    }
    var memo = Memo(
        supplementName: supplementNameController.text,
        quantity: quantityController.text,
        bestBefore: bestBeforeController.text);

    try {
      await database.addMemo(memo);
      print("ok");
      supplementNameController.clear();
      quantityController.clear();
      bestBeforeController.clear();
      Fluttertoast.showToast(
          msg: "登録が完了しました",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
    } on SqliteException catch (e) {
      Fluttertoast.showToast(
          msg: "このサプリは既に登録されています : $e",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
    }
  }

  void _upDateWord() {
    if (supplementNameController.text == "" ||
        quantityController.text == "" ||
        bestBeforeController.text == "") {
      Fluttertoast.showToast(
          msg: "サプリの名前,用量,賞味期限の３つ全てを入力してください", toastLength: Toast.LENGTH_LONG);
      return;
    }
    var memo = Memo(
        supplementName: supplementNameController.text,
        quantity: quantityController.text,
        bestBefore: bestBeforeController.text);

    try {
      database.updateMemo(memo);
      _backToMemoListScreen();
      Fluttertoast.showToast(
          msg: "修正しました", toastLength: Toast.LENGTH_LONG);
      return;
    } on SqliteException catch (e) {
      Fluttertoast.showToast(
          msg: "登録できませんでした : $e", toastLength: Toast.LENGTH_LONG);
      return;
    }
  }
}
