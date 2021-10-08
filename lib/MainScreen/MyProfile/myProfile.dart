import 'package:flutter/material.dart';
import 'package:vk_try3/LoginScreen/loginScreenModel.dart';

class MyProfile extends StatelessWidget {
  final data = LoginScreenModel();

  MyProfile({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 24, 26, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(24, 24, 26, 1),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Text('@paukoman')),
            IconButton(
              splashRadius: 15,
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz,
                color: Color.fromRGBO(113, 170, 235, 1),
                size: 30,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      minRadius: 44,
                      maxRadius: 44,
                      backgroundImage: AssetImage('images/chappie.jpeg'),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${data.profileNames[0]} ${data.profileSurnames[0]}',
                          style: TextStyle(
                            color: Color.fromRGBO(196, 200, 204, 1),
                            fontSize: 18,
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              Size(0, 0),
                            ),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Установить статус',
                            style: TextStyle(
                              color: Color.fromRGBO(113, 170, 235, 1),
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'online',
                          style: TextStyle(
                            color: Color.fromRGBO(144, 148, 153, 1),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Редактировать',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(69, 70, 71, 1),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 14),
                TextButton(
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: Color.fromRGBO(127, 130, 133, 1),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '46 друзей',
                        style: TextStyle(
                          color: Color.fromRGBO(127, 130, 133, 1),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: Color.fromRGBO(127, 130, 133, 1),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Город: Москва',
                        style: TextStyle(
                          color: Color.fromRGBO(127, 130, 133, 1),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wifi,
                        color: Color.fromRGBO(127, 130, 133, 1),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '38 подписчиков',
                        style: TextStyle(
                          color: Color.fromRGBO(127, 130, 133, 1),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Подробная информация',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
