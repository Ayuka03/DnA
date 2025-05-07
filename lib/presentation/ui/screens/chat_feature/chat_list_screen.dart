import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dna_app/presentation/ui/screens/chat_feature/personal_chat_screen.dart';
import 'package:dna_app/presentation/ui/screens/custom_widgets/custom_text_field.dart';
import 'package:dna_app/presentation/ui/screens/custom_widgets/image_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dna_app/entities/user_entity.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({
    super.key,
    required this.userEmail,
    required this.indImage,
  });
  final String userEmail;
  final int indImage;

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  String userName = 'Даниил Бедарев'; //Временно!!!!
  int selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  String newFriend = '';
  bool isError = false;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  List<UserEntity> userFriends = [];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // onWillPop: () async => false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Color.fromARGB(255, 250, 63, 40),

        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                // getUser('2@gmail.com');
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          title: Text('Написать сообщение'),
                          content: Container(
                            alignment: Alignment.centerLeft,
                            height: 120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    !isError
                                        ? Expanded(
                                          child: CustomTextField(
                                            labelName: 'Почта',
                                            controller: _searchController,
                                          ),
                                        )
                                        : Expanded(
                                          child: CustomTextField(
                                            labelName: 'Не найден!',
                                            controller: _searchController,
                                          ),
                                        ),
                                    IconButton(
                                      onPressed: () async {
                                        // String userEmail = '';
                                        await getUser(
                                          _searchController.text.trim(),
                                        );
                                        setState(() {});

                                        _searchController.clear();
                                      },

                                      icon: Icon(Icons.search),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 1,
                                    ),
                                    child: Text(newFriend),
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                          backgroundColor: Colors.white,
                        );
                      },
                    );
                  },
                );
              },
              icon: Icon(Icons.edit_note, size: 35),
              color: Colors.white,
            ),
          ],
          centerTitle: true,
          title: Text(widget.userEmail),

          leading: Container(
            padding: EdgeInsets.all(6),
            child: GestureDetector(
              child: CircleAvatar(
                backgroundImage: AssetImage(imagePath[widget.indImage]),
              ),
              onTap: () {},
            ),
          ),
        ),

        body: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Flexible(
                  child: StreamBuilder(
                    stream:
                        _firestore
                            .collection('users')
                            .doc(_firebaseAuth.currentUser!.uid)
                            .snapshots(),
                    builder: (context, snapshot) {
                      return ListView.separated(
                        separatorBuilder:
                            (context, index) => Divider(
                              thickness: 2,
                              height: 1,
                              color: Color.fromARGB(40, 250, 63, 40),
                            ),
                        itemCount: userFriends.length,
                        itemBuilder: (context, index) {
                          final user = userFriends[index];
                          final imageInd = user.indexImage;
                          return ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 3,
                              horizontal: 10,
                            ),
                            visualDensity: VisualDensity(vertical: -0.2),

                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(imagePath[imageInd]),
                            ),
                            trailing: Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(Icons.circle_rounded, color: Colors.red),
                                // СЮДА ВМЕСТО ИКОНКИ НАДО МАЛЕНЬКУЮ МОЛЕКУЛЬКУ
                                //
                                //
                                //
                                Text(
                                  '1',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            title: Text(
                              user.name,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            subtitle: Text(
                              'Привет, милашка!',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) => PersonalChatScreen(
                                        userName: userName,
                                        imageUrl: imagePath[imageInd],
                                      ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        // bottomNavigationBar: Container(
        //   margin: EdgeInsets.all(10),
        //   decoration: BoxDecoration(
        //     color: const Color.fromARGB(255, 220, 220, 220),
        //     borderRadius: BorderRadius.circular(30),
        //     boxShadow: [
        //       BoxShadow(
        //         color: const Color.fromARGB(100, 0, 0, 0),
        //         blurRadius: 10,
        //         offset: Offset(0, 5),
        //       ),
        //     ],
        //   ),
        //   child: Theme(
        //     data: Theme.of(context).copyWith(
        //       splashColor: Colors.transparent,
        //       splashFactory: NoSplash.splashFactory,
        //     ),
        //     child: BottomNavigationBar(
        //       backgroundColor: Colors.transparent,
        //       elevation: 0,
        //       type: BottomNavigationBarType.fixed,
        //       selectedItemColor: Color.fromARGB(255, 250, 63, 40),
        //       unselectedItemColor: Colors.black45,
        //       selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        //       unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        //       currentIndex: selectedIndex,
        //       onTap: (index) {
        //         if (selectedIndex == index) return;
        //         if (index == 1) {
        //           Navigator.of(context).push(
        //             MaterialPageRoute(
        //               builder:
        //                   (context) =>
        //                       SettingsSrceen(user: 'user', indexBottomBar: 1),
        //             ),
        //           );
        //         }
        //       },
        //       items: const [
        //         BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Чаты'),
        //         BottomNavigationBarItem(
        //           icon: Icon(Icons.settings),
        //           label: 'Настройки',
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }

  Future<void> getUser(String newFriendEmail) async {
    isError = false;
    if (FirebaseAuth.instance.currentUser?.email == newFriendEmail) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Нельзя связаться с собой!')));
      return;
    }

    try {
      var user =
          await FirebaseFirestore.instance
              .collection('users')
              .where('email', isEqualTo: newFriendEmail)
              .get();

      newFriend = user.docs.first['email'];
      var newUserFriend = user.docs.first.data();
      userFriends.add(
        UserEntity(
          email: newUserFriend['email'],
          name: newUserFriend['name'],
          indexImage: newUserFriend['indexImage'],
        ),
      );
      String userId = FirebaseAuth.instance.currentUser!.uid;

      FirebaseFirestore.instance.collection('users').doc(userId).update({
        'friends': FieldValue.arrayUnion([newFriendEmail]),
      });

      String newIdFriend = user.docs.first.id;
      FirebaseFirestore.instance.collection('users').doc(newIdFriend).update({
        'friends': FieldValue.arrayUnion([
          FirebaseAuth.instance.currentUser!.email,
        ]),
      });
      setState(() {});
    } catch (e) {
      print('добавил');
      print(newFriendEmail);
      isError = true;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Пользователь не найден!')));
      return;
    }
  }
}
