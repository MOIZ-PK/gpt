import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:async';

import 'chatmessage.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
//Text controller
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _message = [];

  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration.collapsed(
              hintText: "Ask Me anything",
              hintStyle: TextStyle(color: Colors.blueGrey),
            ),
            // Border(),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.send_rounded),
        ),
      ],
    ).px16();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Chat GPT"),
        ),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: _message.length,
              itemBuilder: (context, index) {
                return _message[index];
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: context.cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }
}
