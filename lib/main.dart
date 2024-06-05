import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Comity',
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

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/TotalCodes.json');
    final data = await json.decode(response);
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
            'App Comity',
          ),
        ),
        body: Center(
            child: SizedBox(
          width: 400,
          child: Column(
            children: <Widget>[
              if (_items.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ExpansionTile(
                        title: Text('Country Code: ${_items[index]["Code"]}'),
                        subtitle: Text('Area Code: ${_items[index]["Area"]}'),
                        children: <Widget>[
                          ListTile(
                            title: Text("ISO Code:  ${_items[index]["ISO"]}"),
                            subtitle: Text(
                                'Region: ${_items[index]["Region1"]} \n Locations:  ${_items[index]["Region2"]}'),
                          )
                        ],
                      );
                    },
                  ),
                )
              else
                ElevatedButton(
                    onPressed: () {
                      readJson();
                    },
                    child: const Center(child: Text("Load Json"))),
            ],
          ),
        )));
  }
}
