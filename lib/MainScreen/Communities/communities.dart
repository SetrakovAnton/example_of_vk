import 'package:flutter/material.dart';
import 'package:vk_try3/LoginScreen/loginScreenModel.dart';

class Community {
  final int id;
  final String name;
  final int countOfMembers;
  final String description;
  final String image;

  Community({
    required this.id,
    required this.name,
    required this.countOfMembers,
    required this.description,
    required this.image,
  });
}

class Communities extends StatefulWidget {
  Communities({Key? key}) : super(key: key);

  @override
  _CommunitiesState createState() => _CommunitiesState();
}

class _CommunitiesState extends State<Communities> {
  final data = LoginScreenModel();
  final _listener = TextEditingController();

  List<Community> _realDataCommunities = [];
  List<Community> _communities = [];

  _createListOfFriends() {
    final names = data.groupNames;
    final description = data.description;
    final groupsImage = data.groupsImage;
    final groupIds = data.groupIds;
    final membersCount = data.membersCount;

    for (int i = 0; i < groupIds.length; i++) {
      _realDataCommunities.add(Community(
          id: groupIds[i],
          name: names[i],
          countOfMembers: membersCount[i],
          description: description[i],
          image: groupsImage[i]));
    }
    _communities = _realDataCommunities;
  }

  List<Community> _listOfCommunities = [];

  void _searching() {
    final query = _listener.text;
    if (query.isNotEmpty) {
      _listOfCommunities = _communities.where((Community community) {
        return community.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _listOfCommunities = _communities;
    }
    setState(() {});
  }

  // _onCommunityTap(int index) {
  //   final id = _listOfCommunities[index].id;
  //   final name = _listOfCommunities[index].name;
  //   final countOfMembers = _listOfCommunities[index].countOfMembers;
  //   final description = _listOfCommunities[index].description;
  //   final image = _listOfCommunities[index].image;
  //   Navigator.pushNamed(context, '/MainScreen/Community', arguments: [
  //     id,
  //     name,
  //     countOfMembers,
  //     description,
  //     image,
  //   ]);
  // }

  @override
  void initState() {
    super.initState();
    _createListOfFriends();
    _listOfCommunities = _communities;
    _listener.addListener(_searching);
  }

  @override
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
            Expanded(child: Text('Cообщества')),
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
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: TextField(
              controller: _listener,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                fillColor: Color.fromRGBO(35, 35, 36, 1),
                filled: true,
                labelText: 'Поиск по сообществам',
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(225, 227, 230, 1),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromRGBO(225, 227, 230, 1),
                ),
                contentPadding: EdgeInsets.only(left: 15.0),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemExtent: 56,
            itemCount: _listOfCommunities.length,
            itemBuilder: (BuildContext context, int index) {
              final community = _listOfCommunities[index];
              return Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(community.image),
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text(
                              '${community.name}',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'участников: ${community.countOfMembers}',
                              style: TextStyle(
                                color: Color.fromRGBO(127, 130, 133, 1),
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.blue.withOpacity(0.2),
                      highlightColor: Colors.blue.withOpacity(0.2),
                      onTap: (){},
                      //onTap: () => _onCommunityTap(index),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
