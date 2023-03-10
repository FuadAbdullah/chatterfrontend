import 'package:flutter/material.dart';

void main() {
  runApp(const ChatterApp());
}

class ChatterApp extends StatelessWidget {
  const ChatterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatterApp - Personal ChatGPT AI',
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.pink,
          onPrimary: Colors.amber.shade100,
          secondary: Colors.pink,
          onSecondary: Colors.amber.shade100,
          error: Colors.red,
          onError: Colors.red.shade900,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
      ),
      home: const ChatterAppHomePage(title: 'ChatterApp'),
    );
  }
}

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
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Placeholder(),
                    Placeholder(),
                    Placeholder(),
                  ],
                )),
              ),
            ),
            Expanded(
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
                          onChanged: (value) => _promptLetterCount(value),
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
                              counterText:
                                  "Prompt letter count: $promptLetterCount"),
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
            )
          ],
        ),
      ),
    );
  }
}
