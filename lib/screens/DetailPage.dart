import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  DetailPage({
    Key key,
  }): super(key: key);

  @override
  _DetailPage createState() => _DetailPage();
}

class _DetailPage extends State < DetailPage > {

  void _returnHome() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    String chatUsername;

    if (arguments != null) chatUsername = arguments['chatUsername'];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(chatUsername),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: < Widget > [
            Expanded(
              child:
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                  child: DashChat(
                    user: ChatUser(
                      name: "Jhon Doe",
                      uid: "xxxxxxxxx",
                      avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
                    ),
                    onSend: (message) => {},
                    messages: < ChatMessage > [
                      ChatMessage(
                        text: "Hello",
                        user: ChatUser(
                          name: "Fayeed",
                          uid: "123456789",
                          avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
                        ),
                        createdAt: DateTime.now(),
                        image: "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
                      )
                    ],
                  )
              ))
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
    );
  }
}