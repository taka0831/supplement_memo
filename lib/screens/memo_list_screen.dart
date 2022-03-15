import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supplement_memo/db/database.dart';
import 'package:supplement_memo/main.dart';

import 'edit_screen.dart';

class MemoListScreen extends StatefulWidget {
  @override
  _MemoListScreenState createState() => _MemoListScreenState();
}

class _MemoListScreenState extends State<MemoListScreen> {
  List<Memo> _memoList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllMemos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("メモ一覧"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewWord(),
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      body: _memoListWidget(),
    );
  }

  _addNewWord() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => EditScreen(
                  status: EditStatus.ADD,
                )));
  }

  void _getAllMemos() async {
    _memoList = await database.allMemos;
    setState(() {});
  }

  Widget _memoListWidget() {
    return ListView.builder(
        itemCount: _memoList.length,
        itemBuilder: (context, int position) => _memoItem(position));
  }

  Widget _memoItem(int position) {
    return Card(
      child: Slidable(
        endActionPane:
            ActionPane(extentRatio: 0.40, motion: ScrollMotion(), children: [
          SlidableAction(
              backgroundColor: Colors.blue,
              icon: Icons.edit,
              label: "編集",
              onPressed: (context) => _editMemo(_memoList[position])),
          SlidableAction(
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: "削除",
              onPressed: (context) => _deleteMemo(_memoList[position]))
        ]),
        child: ListTile(
          tileColor: Colors.green,
          title: Text("${_memoList[position].supplementName}",
              style: TextStyle(fontSize: 30.0,
                color: Colors.white,
              )),
          subtitle: Text(
            "${_memoList[position].quantity}",
            style: TextStyle(fontSize:30.0,color: Colors.white),
          ),
          trailing: Text("${_memoList[position].bestBefore}",
              style: TextStyle(fontSize:25.0,color: Colors.white)),
        ),
      ),
    );
  }

  _deleteMemo(Memo selectedMemo) async {
    await database.deleteMemo(selectedMemo);
    Fluttertoast.showToast(msg: "削除が完了しました", toastLength: Toast.LENGTH_LONG);
    _getAllMemos();
  }

  _editMemo(Memo selectedMemo) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => EditScreen(
                  status: EditStatus.EDIT,
                  memo: selectedMemo,
                )));
  }
}
