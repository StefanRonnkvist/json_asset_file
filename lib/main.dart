import 'dart:async';
import 'package:flutter/material.dart';
import 'readJasonAssetFile.dart';
import 'createReturnWidget.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Comity Asset Json',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _items = [];
  String fileName = 'assets/TotalCodes.json';

  Future<void> readJson() async {
    final data = await readJsonAssetFile(_items, fileName);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'App Comity Json',
          ),
        ),
        body: Center(
            child: SizedBox(
          width: 400,
          child: Column(
            children: <Widget>[
              if (_items.isNotEmpty)
                createReturnWidget(_items)
              else
                ElevatedButton(
                    onPressed: () {
                      readJson();
                    },
                    child: const Center(child: Text("Load Json Asset File"))),
            ],
          ),
        )));
  }
}
