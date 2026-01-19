import 'package:flutter/material.dart';

class InputBar extends StatefulWidget {  final void Function(String) onSendMessage;
const InputBar({Key? key, required this.onSendMessage}) : super(key: key);

@override
State<InputBar> createState() => _InputBarState();
}


class _InputBarState extends State<InputBar> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _textController.text.trim();
    if (text.isNotEmpty) {
      widget.onSendMessage(text);
      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Type your message',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              onSubmitted: (value) => _sendMessage(), // Cleaned up syntax
            ),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            onPressed: _sendMessage, // FIX: Added missing comma
            mini: true,
            backgroundColor: Colors.blue,
            child: const Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
