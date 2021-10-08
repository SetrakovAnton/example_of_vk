import 'package:flutter/material.dart';
import 'package:vk_try3/LoginScreen/loginScreenModel.dart';
// import 'package:vk_try3/MainScreen/Communities/Community/community.dart';
// import 'package:vk_try3/MainScreen/Friends/Friend/friend.dart';
// import 'package:vk_try3/MainScreen/Friends/friends.dart';

import 'LoginScreen/loginScreen.dart';
import 'MainScreen/mainScreen.dart';

class AppStart extends StatelessWidget {
  AppStart({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Color.fromRGBO(90, 90, 90, 1))),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/LoginScreen': (context) => LoginScreenProvider(
            model: LoginScreenModel(), child: const LoginScreen()),
        '/MainScreen': (context) => MainScreen(),
        // '/MainScreen/Friend': (context) {
        //   final name = ModalRoute.of(context)?.settings.arguments as Friend;
        //   final id = ModalRoute.of(context)?.settings.arguments as Friend;
        //   final image = ModalRoute.of(context)?.settings.arguments as Friend;
        //   if (id is int) {
        //     return FriendScreen(
        //       id: id.id,
        //     );
        //   } else {
        //     return FriendScreen(id: 0);
        //   }
        // },
        // '/MainScreen/Community': (context) {
        //   final id = ModalRoute.of(context)?.settings.arguments as int;
        //   if (id is int) {
        //     return CommunityScreen(
        //       id: id,
        //     );
        //   } else {
        //     return CommunityScreen(id: 0);
        //   }
        // },
      },
      initialRoute: '/LoginScreen',
    );
  }
}