import 'package:flutter/material.dart';
import 'package:whatsapp_ui/pages/camera.dart';
import 'package:whatsapp_ui/pages/chats.dart';
import 'package:whatsapp_ui/pages/status.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          //backgroundColor: Color.fromARGB(255, 45, 237, 144),
          title: Text('WhatsApp',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.greenAccent[700])),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const Camera(),
            Chats(),
            const Status(),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.call, color: Colors.greenAccent[700], size: 100),
                  const Text('Call me maybe?', style: TextStyle(fontSize: 20)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
