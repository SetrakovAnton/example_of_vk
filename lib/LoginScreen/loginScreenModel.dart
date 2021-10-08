import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class LoginScreenModel extends ChangeNotifier {
  static late List<String> _profileNames = [];
  get profileNames => _profileNames;
  static late List<String> _profileSurnames = [];
  get profileSurnames => _profileSurnames;

  static late List<String> _names = [];
  get names => _names;
  static late List<String> _surnames = [];
  get surnames => _surnames;
  static late List<String> _images = [];
  get images => _images;
  static late List<int> _ids = [];
  get ids => _ids;

  static late List<String> _groupNames = [];
  get groupNames => _groupNames;
  static late List<String> _description = [];
  get description => _description;
  static late List<String> _groupsImages = [];
  get groupsImage => _groupsImages;
  static late List<int> _groupIds = [];
  get groupIds => _groupIds;
  static late List<int> _membersCount = [];
  get membersCount => _membersCount;

  bool wastouched = false;
  String? _errorText;
  String? _errorTouch;

  String? get errorTouch => _errorTouch;

  String? get errorText => _errorText;
  final text = TextEditingController();

  void touched() {
    wastouched = !wastouched;
    if (wastouched) {
      _errorTouch = 'Данное действие сейчас недоступно';
      notifyListeners();
      return;
    }
    _errorTouch = null;
  }

  void auth() async {
    if (text.text.isNotEmpty) {
      final String _acessToken = text.text;
      final _apId = '223832752';

      var _url1 = Uri.parse(
          'https://api.vk.com/method/account.getProfileInfo?user_ids=$_apId&access_token=$_acessToken&v=5.131');
      var _profileInfo = await http.get(_url1);
      var _profile =
      convert.jsonDecode(_profileInfo.body) as Map<String, dynamic>;
      final _response1 = _profile['response'] as Map<String, dynamic>;
      profileNames.add(_response1['first_name']);
      profileSurnames.add(_response1['last_name']);


      var _url2 = Uri.parse(
          'https://api.vk.com/method/friends.get?user_ids=$_apId&count=15&fields=last_seen,city,photo_50,status&access_token=$_acessToken&v=5.131');
      var _friendsInfo = await http.get(_url2);
      var _friends =
      convert.jsonDecode(_friendsInfo.body) as Map<String, dynamic>;
      final _response2 = _friends['response'] as Map<String, dynamic>;
      final _items2 = _response2['items'];
      for(int i = 0;i < _items2.length;i++){
        names.add(_items2[i]['first_name']);
        surnames.add(_items2[i]['last_name']);
        images.add(_items2[i]['photo_50']);
        ids.add(_items2[i]['id']);
      }

      var _url3 = Uri.parse(
          'https://api.vk.com/method/groups.get?user_ids=$_apId&count=15&extended=1&fields=description,members_count&access_token=$_acessToken&v=5.131');
      var _groupsInfo = await http.get(_url3);
      var _groups =
      convert.jsonDecode(_groupsInfo.body) as Map<String, dynamic>;
      final _response3 = _groups['response'] as Map<String, dynamic>;
      final _items3 = _response3['items'];
      for(int i = 0;i < _items3.length;i++){
        groupNames.add(_items3[i]['name']);
        description.add(_items3[i]['description']);
        groupsImage.add(_items3[i]['photo_50']);
        groupIds.add(_items3[i]['id']);
        membersCount.add(_items3[i]['members_count']);
      }

      if (_friendsInfo.statusCode == 200) {
        print('Все прошло удачно');
      } else {
        print('Что-то пошло не так: ${_friendsInfo.statusCode}');
      }

      if (_groupsInfo.statusCode == 200) {
        print('Все прошло удачно');
      } else {
        print('Что-то пошло не так: ${_groupsInfo.statusCode}');
      }

      if (_profileInfo.statusCode == 200) {
        print('Все прошло удачно');
      } else {
        print('Что-то пошло не так: ${_profileInfo.statusCode}');
      }
    }

  }
}

class LoginScreenProvider extends InheritedNotifier {
  final LoginScreenModel model;

  LoginScreenProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          child: child,
          notifier: model,
        );

  static LoginScreenProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoginScreenProvider>();
  }

  static LoginScreenProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<LoginScreenProvider>()
        ?.widget;
    return widget is LoginScreenProvider ? widget : null;
  }
}
