import 'package:chatapp/mydrawer.dart';
import 'package:flutter/material.dart';

class Contactscreen extends StatefulWidget {
  const Contactscreen({Key? key}) : super(key: key);

  @override
  _ContactscreenState createState() => _ContactscreenState();
}

class _ContactscreenState extends State<Contactscreen> {
  List<dynamic> chatData = [
    {
      'image': 'https://randomuser.me/api/portraits/men/1.jpg',
      'name': 'John Doe',
      'message': 'Hey, how are you doing today?',
      'time': '10:45 AM',
      'unread': 2, // 2 unread messages
    },
    {
      'image': 'https://randomuser.me/api/portraits/women/2.jpg',
      'name': 'Jane Smith',
      'message': 'Don\'t forget the meeting at 3 PM!',
      'time': 'Yesterday',
      'unread': 0, // no unread messages
    },
    {
      'image': 'https://randomuser.me/api/portraits/men/3.jpg',
      'name': 'Michael Brown',
      'message': 'Can you send me the files?',
      'time': 'Mon',
      'unread': 1,
    },
    {
      'image': 'https://randomuser.me/api/portraits/women/4.jpg',
      'name': 'Emily Davis',
      'message': 'Thank you for your help!',
      'time': 'Sun',
      'unread': 0,
    },
    {
      'image': 'https://randomuser.me/api/portraits/men/5.jpg',
      'name': 'Chris Wilson',
      'message': 'Let\'s catch up soon.',
      'time': 'Sat',
      'unread': 5,
    },
    {
      'image': 'https://randomuser.me/api/portraits/women/6.jpg',
      'name': 'Sophia Taylor',
      'message': 'I have sent the documents.',
      'time': 'Fri',
      'unread': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,

        title: Text(
          'Conversation',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit_note))],
      ),
      drawer: Mydrawer(),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chatData.length,
                itemBuilder: (context, index) {
                  var chat = chatData[index];
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(chat['image'] ?? ''),
                            ),
                          ),
                        ),
                        SizedBox(width: 9),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chat['name'] ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                chat['message'] ?? '',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              chat['time'],
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: 20,
                              height: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                              child: Text(
                                chat['unread'].toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
