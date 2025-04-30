import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dna_app/presentation/ui/screens/chat_feature/personal_chat_screen.dart';
import 'package:dna_app/presentation/ui/screens/custom_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key, required this.userEmail});
  final String userEmail;

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  String userName = 'Даниил Бедарев'; //Временно!!!!
  int selectedIndex = 0;
  TextEditingController _searchController = TextEditingController();
  String newFriend = '1';
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
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
                                Expanded(
                                  child: CustomTextField(
                                    labelName: 'Почта',
                                    controller: _searchController,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
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
                backgroundImage: NetworkImage(
                  'https://avatars.mds.yandex.net/i?id=a374adb6500819717978c38b4b4a0799_l-4284908-images-thumbs&ref=rim&n=13&w=914&h=779',
                ),
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
                  child: ListView.separated(
                    separatorBuilder:
                        (context, index) => Divider(
                          thickness: 2,
                          height: 1,
                          color: Color.fromARGB(40, 250, 63, 40),
                        ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final String imageUrl =
                          'https://memepedia.ru/wp-content/uploads/2016/09/uzbagoysya_29873845_orig_.jpeg';
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 10,
                        ),
                        visualDensity: VisualDensity(vertical: -0.2),

                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(imageUrl),
                        ),
                        trailing: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(Icons.circle_rounded, color: Colors.red),
                            // СЮДА ВМЕСТО ИКОНКИ НАДО МАЛЕНЬКУЮ МОЛЕКУЛЬКУ
                            //
                            //
                            //
                            Text('1', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        title: Text(
                          'Даниил Бедарев',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          'Привет, какашка!',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) => PersonalChatScreen(
                                    userName: userName,
                                    imageUrl: imageUrl,
                                  ),
                            ),
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
    final user =
        await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: newFriendEmail)
            .get();
  }
}
