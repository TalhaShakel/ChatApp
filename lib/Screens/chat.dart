import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class chatpage extends StatefulWidget {
  chatpage({Key? key}) : super(key: key);

  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
  TextEditingController sender = TextEditingController();

  TextEditingController password = TextEditingController();
  List sendermsg = ["null"];

  sendmsg() {
    sendermsg.add(sender.text);
    // sendermsg.addAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Bubble(
            alignment: Alignment.bottomLeft,
            margin: BubbleEdges.only(top: 10),
            nip: BubbleNip.leftTop,
            child: Text(
              'Hi, developer!',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Bubble(
            alignment: Alignment.bottomRight,
            margin: BubbleEdges.only(top: 10),
            nip: BubbleNip.rightTop,
            color: Color.fromRGBO(225, 255, 199, 1.0),
            child: Text(sendermsg[0],
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.right),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              height: 55,
              width: MediaQuery.of(context).size.width * 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: sender,
                  decoration: InputDecoration(
                      hintText: "Type here",
                      suffixIcon: IconButton(
                          onPressed: () {
                            sendmsg();
                            setState(() {
                              sender.text;
                            });
                            print(sender.text);
                          },
                          icon: Icon(Icons.send))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
