import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';
import 'package:flutter_gemini/flutter_gemini.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Gemini.init(apiKey:'AIzaSyBBPVR6f9DOl7ZIHJejyVJ_9yABRp214is');
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Chat with Gemini',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: ChatScreen(),  // ← Uses your FULL ChatScreen
      debugShowCheckedModeBanner: false,  // Clean screen
    );
  }
}