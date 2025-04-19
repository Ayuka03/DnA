import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  ChatListScreen({super.key});
  List<dynamic> chts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        centerTitle: true,
        title: Text('data'),
        leading: GestureDetector(
          child: Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  'https://avatars.mds.yandex.net/i?id=c70d5bd654c8ad9b7041453b3226875e_l-12421557-images-thumbs&n=13',
                ),
                fit: BoxFit.cover,
              ),
            ),
            // child: Image.network(
            //   'https://avatars.mds.yandex.net/i?id=c70d5bd654c8ad9b7041453b3226875e_l-12421557-images-thumbs&n=13',
            // ),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 250, 63, 40),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: 10,
                  // itemCount: chts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: ClipOval(
                        child: Image.network(
                          'https://i.pinimg.com/originals/55/64/7d/55647dc681ad4abfe0ba40ba31d4a180.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text('просто данёк'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
