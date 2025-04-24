import 'package:dna_app/presentation/ui/screens/custom_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class PersonalChatScreen extends StatefulWidget {
  const PersonalChatScreen({
    super.key,
    required this.userName,
    required this.imageUrl,
  });
  final String userName;
  final String imageUrl;

  @override
  State<PersonalChatScreen> createState() => _PersonalChatState();
}

class _PersonalChatState extends State<PersonalChatScreen> {
  List<String> messagesFromUser = [];
  final TextEditingController _messageFromUser = TextEditingController();
  final Color _colorFromUser = Colors.black;
  bool isMessage = false;
  @override
  void initState() {
    super.initState();
    _messageFromUser.addListener(listener);
  }

  @override
  void dispose() {
    _messageFromUser.dispose();
    super.dispose();
  }

  void listener() {
    if (_messageFromUser.text.isNotEmpty) {
      isMessage = true;
    } else {
      isMessage = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.imageUrl),
            radius: 25,
          ),
        ],
        title: Text(widget.userName),

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 250, 63, 40),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: messagesFromUser.length,
                  // messagesFromUser.length,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              width: 3,
                              color: const Color.fromARGB(235, 255, 114, 104),
                            ),
                            color: const Color.fromARGB(147, 255, 255, 255),
                          ),
                          child: Text(
                            messagesFromUser[index],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelName: 'Введите сообщение',
                        controller: _messageFromUser,
                      ),
                    ),
                    isMessage
                        ? IconButton(
                          onPressed: () {
                            sendMessage(_messageFromUser.text.trim());
                            _messageFromUser.clear();
                            print(
                              _colorFromUser.toString(),
                            ); //Полезная штука, надо обсудить
                          },
                          icon: Icon(
                            Icons.send_rounded,
                            size: 35,
                            color: const Color.fromARGB(209, 250, 77, 65),
                          ),
                        )
                        : IconButton(
                          highlightColor: Colors.transparent,
                          onPressed: () {},
                          icon: Icon(
                            Icons.send_rounded,
                            size: 35,
                            color: const Color.fromARGB(100, 250, 77, 65),
                          ),
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendMessage(String message) {
    if (message != '') {
      setState(() {
        messagesFromUser.add(message);
      });
    }
  }
}
