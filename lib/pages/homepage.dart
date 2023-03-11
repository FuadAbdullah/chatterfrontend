import 'package:flutter/material.dart';

class ChatterAppHomePage extends StatefulWidget {
  const ChatterAppHomePage({super.key, required this.title});
  final String title;

  @override
  State<ChatterAppHomePage> createState() => _ChatterAppHomePageState();
}

class _ChatterAppHomePageState extends State<ChatterAppHomePage> {
  int promptLetterCount = 0;

  void _promptLetterCount(String value) {
    setState(() => promptLetterCount = value.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            expandedChatView(),
            expandedChatController(_promptLetterCount, promptLetterCount),
          ],
        ),
      ),
    );
  }
}

Expanded expandedChatController(Function function, int count) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 15,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: TextField(
                onChanged: (value) => function(value),
                maxLength: 1024,
                maxLines: 5,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    hintText: "Insert your prompt here",
                    hintMaxLines: 1,
                    counterText: "Prompt letter count: $count"),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 64.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.send_rounded,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Expanded expandedChatView() {
  return Expanded(
    flex: 3,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            rightChatContainer(),
            leftChatContainer(),
          ],
        ),
      ),
    ),
  );
}

Padding leftChatContainer() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: LayoutBuilder(
      builder: (
        BuildContext ctx,
        BoxConstraints constraints,
      ) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth / 5,
                maxWidth: constraints.maxWidth / 1.2,
                minHeight: 100,
                maxHeight: 500,
              ),
              child: Container(
                color: Colors.blue,
                height: 100,
                width: 2000,
              ),
            ),
          ],
        );
      },
    ),
  );
}

Padding rightChatContainer() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: LayoutBuilder(
      builder: (
        BuildContext ctx,
        BoxConstraints constraints,
      ) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth / 5,
                maxWidth: constraints.maxWidth / 1.2,
                minHeight: 100,
                maxHeight: 500,
              ),
              child: Container(
                color: Colors.blue,
                height: 100,
                width: 2000,
              ),
            ),
          ],
        );
      },
    ),
  );
}
