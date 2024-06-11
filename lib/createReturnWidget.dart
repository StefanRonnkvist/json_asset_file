import 'package:flutter/material.dart';

Expanded createReturnWidget(List items) => Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            title: Text('Country Code: ${items[index]["Code"]}'),
            subtitle: Text('Area Code: ${items[index]["Area"]}'),
            children: <Widget>[
              ListTile(
                title: Text("ISO Code:  ${items[index]["ISO"]}"),
                subtitle: Text(
                    'Region: ${items[index]["Region1"]}\nLocations:  ${items[index]["Region2"]}'),
              )
            ],
          );
        },
      ),
    );
