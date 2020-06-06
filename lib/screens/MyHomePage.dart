import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }): super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State < MyHomePage > {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _enterDetail(chatUsername){
    Navigator.pushNamed(context, '/detail' ,  arguments: {'chatUsername': chatUsername });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quick Chat"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: < Widget > [
            Expanded(
              child:
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                  child: ListView(
                    children: < Widget > [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                        ),
                        title: Text('Michael'),
                        subtitle: Text('Here is a second line'),
                        onTap: () => _enterDetail('Michael'),
                      ),
                    ]
                  ),
              ))
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
    );
  }
}