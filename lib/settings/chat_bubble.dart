import 'package:flutter/material.dart';

TextStyle chatBubbleTextStyle(bool isMe) {
  return TextStyle(
    color: isMe ? Colors.white : Colors.black,
    fontSize: 16,
  );
}

BoxDecoration chatBubbleBoxDecoration(bool isMe) {
  return BoxDecoration(
    boxShadow: const <BoxShadow>[
      BoxShadow(
        color: Colors.black26,
        blurRadius: 8.0,
        offset: Offset(0.0, 4.0),
      ),
    ],
    color: isMe ? Colors.pink.shade900 : Colors.pink.shade100,
    borderRadius: BorderRadius.only(
      topLeft: const Radius.circular(12),
      topRight: const Radius.circular(12),
      bottomLeft: isMe ? const Radius.circular(12) : const Radius.circular(0),
      bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(12),
    ),
  );
}
