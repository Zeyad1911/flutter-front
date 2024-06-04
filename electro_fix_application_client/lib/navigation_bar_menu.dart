import 'package:electro_fix_application/features/profile/presentation_layer/screens/profilepage.dart';
import 'package:flutter/material.dart';
import 'features/home/presentation_layer/screens/homepage.dart';
import 'features/posts/presentation_layer/screens/myposts.dart';
import 'features/requests/presentation_layer/screens/myrequests.dart';
import 'features/saved/presentation_layer/screens/mysaved.dart';

class NavigationBarMenu extends StatefulWidget {
  const NavigationBarMenu({super.key, this.userID});

  final String? userID;

  @override
  State<NavigationBarMenu> createState() => _NavigationBarMenuState();
}

class _NavigationBarMenuState extends State<NavigationBarMenu> {
  int selectedPage = 0;

  void onTapItem(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  List<Widget> myScreens = [];

  @override
  void initState() {
    super.initState();
    myScreens = [
      HomePage(
        userID: widget.userID,
      ),
      MyPosts(
        userID: widget.userID,
      ),
      const MyRequests(),
      const MySaved(),
      ProfilePage(
        userID: widget.userID,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: selectedPage == 0
                  ? const Icon(Icons.home)
                  : const Icon(Icons.home_outlined),
              label: "Tech"),
          BottomNavigationBarItem(
              icon: selectedPage == 1
                  ? const Icon(Icons.my_library_books)
                  : const Icon(Icons.my_library_books_outlined),
              label: "My Posts"),
          BottomNavigationBarItem(
              icon: selectedPage == 2
                  ? const Icon(Icons.chat)
                  : const Icon(Icons.chat_outlined),
              label: "My Request"),
          BottomNavigationBarItem(
              icon: selectedPage == 3
                  ? const Icon(Icons.save_alt)
                  : const Icon(Icons.save_alt_rounded),
              label: "My Saved"),
          BottomNavigationBarItem(
              icon: selectedPage == 4
                  ? const Icon(Icons.person)
                  : const Icon(Icons.person_outline),
              label: "Profile ")
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.teal,
        currentIndex: selectedPage,
        onTap: onTapItem,
      ),
      body: IndexedStack(
        index: selectedPage,
        children: myScreens,
      ),
    );
  }
}
