import 'package:flutter/material.dart';
import 'package:vk_try3/LoginScreen/loginScreenModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Widget build(BuildContext context) {
    final api = LoginScreenProvider.read(context)?.model;
    final model = LoginScreenProvider.watch(context)?.model;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(24, 24, 26, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.crop_square),
            Text('ВНЕКОНТАКТА'),
          ],
        ),
      ),
      body: ListView(
        children: [
          ErrorButton(),
          ErrorText(),
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            color: const Color.fromRGBO(25, 25, 26, 1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone_android,
                  color: Color.fromRGBO(113, 170, 235, 1),
                ),
                SizedBox(width: 10.0),
                Text(
                  'Установите приложение Внеконтакта',
                  style: TextStyle(
                    color: Color.fromRGBO(73, 134, 204, 1),
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(width: 80.0),
                Expanded(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromRGBO(113, 170, 235, 1),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
            color: const Color.fromRGBO(25, 25, 26, 1),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Мобильная версия поможет вам оставаться Внеконтакта,даже если вы далеко от компьютера',
                  style: TextStyle(
                    color: const Color.fromRGBO(93, 95, 97, 1),
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  color: const Color.fromRGBO(25, 25, 26, 1),
                  child: Center(
                    child: TextFormField(
                      controller: api?.text,
                      obscureText: true,
                      cursorColor: const Color.fromRGBO(225, 227, 230, 1),
                      decoration: InputDecoration(
                        labelText: 'Введите ваш access token',
                        labelStyle: const TextStyle(
                          color: Color.fromRGBO(225, 227, 230, 1),
                        ),
                        contentPadding: EdgeInsets.only(left: 15.0),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(113, 170, 235, 1),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(93, 95, 97, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                        Navigator.pushReplacementNamed(context, '/MainScreen');
                        api?.auth();
                    },
                    child: Text(
                      'Войти',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: model?.touched,
                    child: Text(
                      'Забыли token?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(73, 134, 204, 1),
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Впервые Внеконтакта?',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(144, 148, 153, 1),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: model?.touched,
                    child: Text(
                      'Зарегистрироваться',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(75, 179, 75, 1),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: model?.touched,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      side: MaterialStateProperty.all(
                        BorderSide(
                          color: Color.fromRGBO(93, 95, 97, 1),
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook),
                        SizedBox(width: 7),
                        Text(
                          'Войти через Facebook',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Українська English',
                style: TextStyle(
                  wordSpacing: 10,
                  color: Color.fromRGBO(144, 148, 153, 1),
                ),
              ),
              SizedBox(width: 15),
              Text(
                'all languages  >>',
                style: TextStyle(
                  color: Color.fromRGBO(144, 148, 153, 1),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'Версия для компьютера',
              style: TextStyle(
                color: Color.fromRGBO(144, 148, 153, 1),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ErrorText extends StatelessWidget {
  const ErrorText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = LoginScreenProvider.watch(context)?.model.errorText;
    if (errorMessage == null) {
      return SizedBox.shrink();
    }
    return Container(
      color: Colors.red,
      child: Center(
        child: Text(
          '$errorMessage',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ErrorButton extends StatelessWidget {
  ErrorButton({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final error = LoginScreenProvider.watch(context)?.model.errorTouch;
    if (error == null) {
      return SizedBox.shrink();
    }
    return Container(
      height: 20,
      color: Colors.red,
      child: Center(
        child: Text(
          '$error',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
