import 'package:chatterapp/settings/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatterAppHomePage extends StatefulWidget {
  const ChatterAppHomePage({super.key, required this.title});
  final String title;

  @override
  State<ChatterAppHomePage> createState() => _ChatterAppHomePageState();
}

class _ChatterAppHomePageState extends State<ChatterAppHomePage> {
  int? _promptLetterCount;
  bool? _isSendable;
  String? _prompt;
  TextEditingController? _promptTextFieldController;
  FocusNode? _sendButtonFocusNode;
  FocusNode? _promptTextFieldFocusNode;

  @override
  void initState() {
    super.initState();
    _promptLetterCount = 0;
    _isSendable = false;
    _prompt = "";
    _sendButtonFocusNode = FocusNode();
    _promptTextFieldController = TextEditingController();
    _promptTextFieldFocusNode = FocusNode(onKey: (node, event) {
      if (event.isShiftPressed) return KeyEventResult.ignored;
      if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
        _sendMessage();
        // _sendButtonFocusNode!.requestFocus();
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    });
  }

  @override
  void dispose() {
    _promptTextFieldFocusNode!.dispose();
    _promptTextFieldController!.dispose();
    _sendButtonFocusNode!.dispose();
    super.dispose();
  }

  List<String> messages = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu metus enim. Duis condimentum dignissim augue in dignissim. Ut scelerisque nunc ut dui maximus, vitae congue massa sagittis. In fermentum faucibus sagittis. Suspendisse egestas nibh velit, at porta ex finibus eget. Sed sed nulla at dolor feugiat rhoncus. Ut egestas maximus tempor. Proin vel justo nec ante ultrices condimentum. Pellentesque in leo ac mi tempus convallis dapibus sit amet urna. Sed aliquet tempor quam, id commodo diam porta eu. Vestibulum dapibus tempus faucibus. Aenean id diam maximus, rhoncus eros at, pellentesque mauris. Sed non risus ac metus viverra condimentum. Phasellus efficitur fermentum dapibus. Nulla vulputate magna vel quam laoreet pulvinar. Suspendisse potenti. Mauris nec pulvinar nisi. Donec vestibulum nunc eget est malesuada, quis egestas lorem tristique. Integer viverra, nunc blandit facilisis dictum, nisi nisi euismod odio, a hendrerit dui felis a orci. Sed blandit convallis ultricies. Donec sed lectus nec dui biam.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu metus enim. Duis condimentum dignissim augue in dignissim. Ut scelerisque nunc ut dui maximus, vitae congue massa sagittis. In fermentum faucibus sagittis. Suspendisse egestas nibh velit, at porta ex finibus eget. Sed sed nulla at dolor feugiat rhoncus. Ut egestas maximus tempor. Proin vel justo nec ante ultrices condimentum. Pellentesque in leo ac mi tempus convallis dapibus sit amet urna. Sed aliquet tempor quam, id commodo diam porta eu. Vestibulum dapibus tempus faucibus. Aenean id diam maximus, rhoncus eros at, pellentesque mauris. Sed non risus ac metus viverra condimentum. Phasellus efficitur fermentum dapibus. Nulla vulputate magna vel quam laoreet pulvinar. Suspendisse potenti. Mauris nec pulvinar nisi. Donec vestibulum nunc eget est malesuada, quis egestas lorem tristique. Integer viverra, nunc blandit facilisis dictum, nisi nisi euismod odio, a hendrerit dui felis a orci. Sed blandit convallis ultricies. Donec sed lectus nec dui biam.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu metus enim. Duis condimentum dignissim augue in dignissim. Ut scelerisque nunc ut dui maximus, vitae congue massa sagittis. In fermentum faucibus sagittis. Suspendisse egestas nibh velit, at porta ex finibus eget. Sed sed nulla at dolor feugiat rhoncus. Ut egestas maximus tempor. Proin vel justo nec ante ultrices condimentum. Pellentesque in leo ac mi tempus convallis dapibus sit amet urna. Sed aliquet tempor quam, id commodo diam porta eu. Vestibulum dapibus tempus faucibus. Aenean id diam maximus, rhoncus eros at, pellentesque mauris. Sed non risus ac metus viverra condimentum. Phasellus efficitur fermentum dapibus. Nulla vulputate magna vel quam laoreet pulvinar. Suspendisse potenti. Mauris nec pulvinar nisi. Donec vestibulum nunc eget est malesuada, quis egestas lorem tristique. Integer viverra, nunc blandit facilisis dictum, nisi nisi euismod odio, a hendrerit dui felis a orci. Sed blandit convallis ultricies. Donec sed lectus nec dui biam.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu metus enim. Duis condimentum dignissim augue in dignissim. Ut scelerisque nunc ut dui maximus, vitae congue massa sagittis. In fermentum faucibus sagittis. Suspendisse egestas nibh velit, at porta ex finibus eget. Sed sed nulla at dolor feugiat rhoncus. Ut egestas maximus tempor. Proin vel justo nec ante ultrices condimentum. Pellentesque in leo ac mi tempus convallis dapibus sit amet urna. Sed aliquet tempor quam, id commodo diam porta eu. Vestibulum dapibus tempus faucibus. Aenean id diam maximus, rhoncus eros at, pellentesque mauris. Sed non risus ac metus viverra condimentum. Phasellus efficitur fermentum dapibus. Nulla vulputate magna vel quam laoreet pulvinar. Suspendisse potenti. Mauris nec pulvinar nisi. Donec vestibulum nunc eget est malesuada, quis egestas lorem tristique. Integer viverra, nunc blandit facilisis dictum, nisi nisi euismod odio, a hendrerit dui felis a orci. Sed blandit convallis ultricies. Donec sed lectus nec dui biam.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu metus enim. Duis condimentum dignissim augue in dignissim. Ut scelerisque nunc ut dui maximus, vitae congue massa sagittis. In fermentum faucibus sagittis. Suspendisse egestas nibh velit, at porta ex finibus eget. Sed sed nulla at dolor feugiat rhoncus. Ut egestas maximus tempor. Proin vel justo nec ante ultrices condimentum. Pellentesque in leo ac mi tempus convallis dapibus sit amet urna. Sed aliquet tempor quam, id commodo diam porta eu. Vestibulum dapibus tempus faucibus. Aenean id diam maximus, rhoncus eros at, pellentesque mauris. Sed non risus ac metus viverra condimentum. Phasellus efficitur fermentum dapibus. Nulla vulputate magna vel quam laoreet pulvinar. Suspendisse potenti. Mauris nec pulvinar nisi. Donec vestibulum nunc eget est malesuada, quis egestas lorem tristique. Integer viverra, nunc blandit facilisis dictum, nisi nisi euismod odio, a hendrerit dui felis a orci. Sed blandit convallis ultricies. Donec sed lectus nec dui biam.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu metus enim. Duis condimentum dignissim augue in dignissim. Ut scelerisque nunc ut dui maximus, vitae congue massa sagittis. In fermentum faucibus sagittis. Suspendisse egestas nibh velit, at porta ex finibus eget. Sed sed nulla at dolor feugiat rhoncus. Ut egestas maximus tempor. Proin vel justo nec ante ultrices condimentum. Pellentesque in leo ac mi tempus convallis dapibus sit amet urna. Sed aliquet tempor quam, id commodo diam porta eu. Vestibulum dapibus tempus faucibus. Aenean id diam maximus, rhoncus eros at, pellentesque mauris. Sed non risus ac metus viverra condimentum. Phasellus efficitur fermentum dapibus. Nulla vulputate magna vel quam laoreet pulvinar. Suspendisse potenti. Mauris nec pulvinar nisi. Donec vestibulum nunc eget est malesuada, quis egestas lorem tristique. Integer viverra, nunc blandit facilisis dictum, nisi nisi euismod odio, a hendrerit dui felis a orci. Sed blandit convallis ultricies. Donec sed lectus nec dui biam.',
  ];

  void _promptController(String value) {
    setState(() {
      _promptLetterCount = value.length;
      _prompt = value.trim();
      _isSendable = _prompt!.isNotEmpty;
    });
  }

  void _sendMessage() {
    setState(() {
      messages.add(_prompt!.trim());
      _promptTextFieldController!.clear();
      _prompt = "";
      _promptLetterCount = 0;
      _isSendable = _prompt!.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          expandedChatView(messages),
          expandedChatController(
            _promptTextFieldController!,
            _promptTextFieldFocusNode!,
            _sendButtonFocusNode!,
            _promptController,
            _promptLetterCount!,
            _sendMessage,
            _isSendable!,
          ),
        ],
      ),
    );
  }
}

Expanded expandedChatController(
  TextEditingController textFieldController,
  FocusNode textFieldFocusNode,
  FocusNode sendFocusNode,
  Function countFn,
  int count,
  Function sendFn,
  bool isSendable,
) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          expandedTextField(
            textFieldController,
            textFieldFocusNode,
            countFn,
            count,
          ),
          expandedSendButton(
            sendFocusNode,
            sendFn,
            isSendable,
          ),
        ],
      ),
    ),
  );
}

Expanded expandedSendButton(
  FocusNode sendFocusNode,
  Function send,
  bool isSendable,
) {
  return Expanded(
    flex: 1,
    child: Padding(
      padding: const EdgeInsets.only(top: 64.0),
      child: ElevatedButton(
        focusNode: sendFocusNode,
        onPressed: isSendable ? () => send() : null,
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Icon(
            Icons.send_rounded,
          ),
        ),
      ),
    ),
  );
}

Expanded expandedTextField(
  TextEditingController controller,
  FocusNode textFieldFocusNode,
  Function sendFn,
  int count,
) {
  return Expanded(
    flex: 15,
    child: Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: TextField(
        focusNode: textFieldFocusNode,
        controller: controller,
        onChanged: (value) => sendFn(value),
        onSubmitted: (value) => sendFn(value),
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
  );
}

Expanded expandedChatView(List<String> messages) {
  return Expanded(
    flex: 3,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return chatBubble(
            index % 2 == 0 ? true : false,
            messages[index],
          );
        },
      ),
    ),
  );
}

Padding chatBubble(bool isMe, String message) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth / 5,
                maxWidth: constraints.maxWidth / 1.2,
              ),
              child: Container(
                  decoration: chatBubbleBoxDecoration(isMe),
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: SelectableText(
                    message,
                    style: chatBubbleTextStyle(isMe),
                  )),
            ),
          ],
        );
      },
    ),
  );
}
