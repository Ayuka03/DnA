import 'package:dna_app/presentation/ui/custom_text_field.dart';
import 'package:flutter/material.dart';

class PersonalChat extends StatefulWidget {
  const PersonalChat({
    super.key,
    required this.userName,
    required this.imageUrl,
  });
  final String userName;
  final String imageUrl;

  @override
  State<PersonalChat> createState() => _PersonalChatState();
}

class _PersonalChatState extends State<PersonalChat> {
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
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.w500,
        ),
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
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(235, 255, 114, 104),
                          ),
                          color: const Color.fromARGB(148, 255, 112, 101),
                        ),
                        child: Text('ладно'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.all(4),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(235, 255, 114, 104),
                          ),
                          color: const Color.fromARGB(148, 255, 112, 101),
                        ),
                        child: Text('я'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(235, 255, 114, 104),
                          ),
                          color: const Color.fromARGB(148, 255, 112, 101),
                        ),
                        child: Text('пенис'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(labelName: 'Введите сообщение'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.send_outlined,
                        color: const Color.fromARGB(209, 250, 77, 65),
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
}
