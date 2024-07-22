import 'package:flutter/material.dart';

class home_appbarwidget extends StatelessWidget {
  
  const home_appbarwidget({
    super.key,
  });

  
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          child: ClipOval(
            child: Image.asset(
              'assets/images/user.png',
              width: 50,
              height: 50,
            ),
          ),
        ),
        SizedBox(width: 5.0),
        Icon(
          Icons.location_on,
          size: 40,
          color: Color.fromARGB(255, 240, 241, 241),
        ),
        SizedBox(width: 5.0),
         Text("10,Quốc Lộ 20",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        SizedBox(width: 20.0),
        Icon(
          Icons.chat,
          size: 30.0,
          color: const Color.fromARGB(255, 249, 250, 249),
        ),
        SizedBox(width: 5.0),
        Icon(
          Icons.notifications,
          size: 30.0,
          color: const Color.fromARGB(255, 248, 248, 247),
        ),
      ],
    );
  }
}
