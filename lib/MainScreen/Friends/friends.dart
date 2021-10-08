import 'package:flutter/material.dart';
import 'package:vk_try3/LoginScreen/loginScreenModel.dart';

class Friend {
  int id;
  String name;
  String image;

  Friend({
    required this.id,
    required this.name,
    required this.image,
  });
}

class Friends extends StatefulWidget {
  Friends({Key? key}) : super(key: key);

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  final _listener = TextEditingController();
  final data = LoginScreenModel();

  List<Friend> _realDataFriends = [];
  List<Friend> _friends = [];
  _createListOfFriends() {
    final ids = data.ids;
    final names = data.names;
    final surnames = data.surnames;
    final images = data.images;

    for(int i = 0;i < ids.length;i++){
      _realDataFriends.add(Friend(id: ids[i], name: '${names[i]} ${surnames[i]}',image: images[i]));
    }
    _friends = _realDataFriends;
  }

  List<Friend> _listOfFriends = [];

  _searching() {
    final _query = _listener.text;
    if (_query.isNotEmpty) {
      _listOfFriends = _friends.where((Friend friend) {
        return friend.name.toLowerCase().contains(_query.toLowerCase());
      }).toList();
    } else {
      _listOfFriends = _friends;
    }
    setState(() {});
  }

  // _onFriendTap(int index) {
  //   final id = _listOfFriends[index].id;
  //   final name = _listOfFriends[index].name;
  //   final image = _listOfFriends[index].image;
  //   Navigator.pushNamed(context, '/MainScreen/Friend', arguments: [id,name,image]);
  // }

  @override
  void initState() {
    super.initState();
    _createListOfFriends();
    _listOfFriends = _friends;
    _listener.addListener(_searching);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < _listOfFriends.length; i++) {
      final friend = _listOfFriends[i];
      items.add(
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.blue.withOpacity(0.2),
                  highlightColor: Colors.blue.withOpacity(0.2),
                  onTap: (){},
                  //onTap: () => _onFriendTap(i),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(backgroundImage: NetworkImage(friend.image),),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '${friend.name}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.messenger_outline,
                    color: Color.fromRGBO(113, 170, 235, 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 24, 26, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(24, 24, 26, 1),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text('Все друзья'),
            ),
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
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        //primary: true,
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: TextField(
                  controller: _listener,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color.fromRGBO(225, 227, 230, 1),
                    ),
                    fillColor: Color.fromRGBO(35, 35, 36, 1),
                    filled: true,
                    labelText: 'Поиск по друзьям',
                    labelStyle: const TextStyle(
                      color: Color.fromRGBO(225, 227, 230, 1),
                    ),
                    contentPadding: EdgeInsets.only(left: 15.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemExtent: 56,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return items[index];
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
