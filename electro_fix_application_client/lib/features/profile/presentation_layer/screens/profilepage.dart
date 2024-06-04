import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_fix_application/core/widgets/card_info.dart';
import 'package:electro_fix_application/core/widgets/card_review.dart';
import 'package:flutter/material.dart';
import 'package:electro_fix_application/core/theme/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, this.userID});

  final String? userID;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  DocumentSnapshot? userInfo;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    getAllUserInformation();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Future<void> getAllUserInformation() async {
    if (widget.userID != null) {
      userInfo = await FirebaseFirestore.instance
          .collection("Users")
          .doc(widget.userID)
          .get();

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          PopupMenuButton(
            color: ColorManager.backgroundcolorofformfield,
            surfaceTintColor: ColorManager.backgroundcolorofformfield,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'Settiings',
                  onTap: () {},
                  child: const Text('Settings'),
                ),
                PopupMenuItem(
                  value: 'About',
                  onTap: () {},
                  child: const Text('About'),
                ),
                PopupMenuItem(
                  value: 'Sign Out',
                  onTap: () {},
                  child: const Text('Sign Out'),
                ),
              ];
            },
          )
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            const CircleAvatar(
              radius: 70,
              backgroundColor: Colors.teal,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                userInfo?.get("username") ?? "Error",
                style:
                    const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            TabBar(
              overlayColor: WidgetStatePropertyAll(Colors.grey[300]),
              indicatorColor: Colors.black,
              controller: tabController,
              splashBorderRadius: BorderRadius.circular(40),
              tabs: const [
                Tab(
                  height: 45,
                  child: Text(
                    "Information",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  height: 45,
                  child: Text(
                    "Reviews",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 455,
              child: TabBarView(
                controller: tabController,
                children: [
                  buildInformation(),
                  buildReviews(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildReviews() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CardReview(
            userName: "Abdallah",
            reviewFeedback:
                "My stay at HotelName was nothing short of spectacular. The hotel’s elegant design, combined with its top-notch amenities, made for a truly relaxing and enjoyable experience.");
      },
    );
  }

  Widget buildInformation() {
    if (userInfo == null) {
      return const CircularProgressIndicator(
        color: Colors.teal,
        strokeWidth: 1,
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListView(
        children: [
          CardInformation(
            hintText: "Email",
            info: userInfo!.get("email")?.toString() ?? '',
            prefixIcon: const Icon(Icons.email_rounded),
          ),
          const SizedBox(
            height: 10,
          ),
          CardInformation(
            hintText: "PhoneNumber",
            info: userInfo!.get("phoneNumber")?.toString() ?? '',
            prefixIcon: const Icon(Icons.phone_android_rounded),
          ),
          const SizedBox(
            height: 10,
          ),
          CardInformation(
            hintText: "Location",
            info: userInfo!.get("location")?.toString() ?? '',
            prefixIcon: const Icon(Icons.location_city_rounded),
          ),
        ],
      ),
    );
  }
}
