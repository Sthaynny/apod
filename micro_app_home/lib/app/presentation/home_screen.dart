import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home 1'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Home 1"),
            TextButton(
              onPressed: () {},
              child: const Text('Ir para Home 2'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Ir para tela Secundaria'),
            ),
          ],
        ),
      ),
    );
  }
}
