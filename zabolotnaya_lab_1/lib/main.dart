import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: UserPanel(),
));

class UserPanel extends StatefulWidget {
  const UserPanel({Key? key}) : super(key: key);

  @override
  State<UserPanel> createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {

  int _count = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: const Text('User'),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 30),),
                  const Text('Natalie', style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),),
                  const Padding(padding: EdgeInsets.only(top: 10),),
                  const CircleAvatar(
                    backgroundColor: Colors.lightGreenAccent,
                    radius: 50,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10),),
                  Row(
                    children: const [
                      Icon(Icons.mail_outline, size: 25,),
                      Padding(padding: EdgeInsets.only(left: 10),),
                      Text('admin@ftr.com', style: TextStyle(color: Colors.white),),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10),),
                  Text('Count: $_count', style: const TextStyle(color: Colors.white),),
                ],
              ),
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_circle_sharp),
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          setState(() {
            _count++;
          });
        },
      ),
    );
  }
}
