import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class DetailPage extends StatefulWidget {
  DetailPage({
    Key key,
  }): super(key: key);

  final WebSocketChannel channel = IOWebSocketChannel.connect('wss://echo.websocket.org'); //this string should not be here

  @override
  _DetailPage createState() => _DetailPage();
}

class _DetailPage extends State < DetailPage > {
  List<ChatMessage> _messageList = new List<ChatMessage>();

  final _myUser = ChatUser(
      name: "Jhon Doe",
      uid: "xxxxxxxxx",
      avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
   );

  var _otherUser = ChatUser(
       name: "Fayeed",
        uid: "123456789",
        avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
   );

  void _sendMessage(ChatMessage message) {
    widget.channel.sink.add(message.text);
    _messageListBuilder(message.text, _myUser);
  }

  _messageListBuilder(message , user){
    var _newMessage = ChatMessage(
        text: message,
        user: user,
        createdAt: DateTime.now(),
    );

    _messageList.add(_newMessage);
    return _messageList;
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
                  child: StreamBuilder(
                    stream: widget.channel.stream,
                    builder: (context, snapshot) {
                      var text  = snapshot.hasData ? '${snapshot.data}' : 'fuck';
                      return
                      DashChat(
                        user: _myUser,
                        onSend: _sendMessage,
                        messages: _messageListBuilder(text , _otherUser),
                      );
                    },
                  )
              ))
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
    );
  }
}