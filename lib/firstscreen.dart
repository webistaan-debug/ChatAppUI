import 'package:chatapp/mydrawer.dart';
import 'package:flutter/material.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({Key? key}) : super(key: key);

  @override
  _FirstscreenState createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  List messages = [];
  TextEditingController messagecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Asghar Sial',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Online', style: TextStyle(fontSize: 10)),
          ],
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.call))],
      ),
      drawer: Mydrawer(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Today',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    // height: 150,
                    padding: EdgeInsets.only(bottom: 40),
                    decoration: BoxDecoration(color: Colors.black),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://ui-avatars.com/api/?name=John+Doe',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),

                            Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7,
                              ),
                              // height: 100,
                              // width: 250,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadiusDirectional.only(
                                  bottomEnd: Radius.circular(12),
                                  topStart: Radius.circular(12),
                                  topEnd: Radius.circular(12),
                                  bottomStart: Radius.circular(0),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    messages[index] ?? '',
                                    // maxLines: 20,
                                    // overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '10:45 AM',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
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
            /*Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(color: Colors.black),
              child: Stack(
                children: [
                  Positioned(
                    right: 20,
                    top: 10,
                    child: Container(
                      width: 250,
                      height: 100,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(12),
                          topEnd: Radius.circular(12),
                          topStart: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text('Hi, how are you?')],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 10,
                    child: Text(
                      '10:45 AM',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),*/
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.black,

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add_a_photo)),
            SizedBox(width: 15),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),

                child: TextFormField(
                  controller: messagecontroller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'type your message',
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
            ),
            SizedBox(width: 15),
            IconButton(
              onPressed: () {
                setState(() {
                  messages.add(messagecontroller.text);
                  messagecontroller.clear();
                });
              },
              icon: Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
