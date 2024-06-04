import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_fix_application/core/widgets/post_button.dart';
import 'package:electro_fix_application/core/widgets/tech_card.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.userID});

  final String? userID;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final searchController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  List<DocumentSnapshot>? tvTechnicians = [];
  List<DocumentSnapshot>? refrigeratorTechnicians = [];
  List<DocumentSnapshot>? washingMachineTechnicians = [];
  List<DocumentSnapshot>? airConditionerTechnicians = [];
  List<DocumentSnapshot>? otherTechnicians = [];

  bool isLoading = true;
  String username = "";

  Future<void> getAllTechnicians() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection("Technicians").get();

    for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
      String specialization = documentSnapshot.get("specialization");

      setState(() {
        if (specialization == "TVs") {
          tvTechnicians!.add(documentSnapshot);
        } else if (specialization == "Refrigerator") {
          refrigeratorTechnicians!.add(documentSnapshot);
        } else if (specialization == "Washing Machines") {
          washingMachineTechnicians!.add(documentSnapshot);
        } else if (specialization == "Air Conditioner") {
          airConditionerTechnicians!.add(documentSnapshot);
        } else if (specialization == "Other Appliances") {
          otherTechnicians!.add(documentSnapshot);
        }

        isLoading == false;
      });
    }
  }

  Future<void> getUserName() async {
    final userDoc = await FirebaseFirestore.instance
        .collection("Users")
        .doc(widget.userID)
        .get();
    username = userDoc.get("username");
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    getAllTechnicians();
    getUserName();
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  Widget buildTv() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemCount: tvTechnicians!.length,
      itemBuilder: (context, index) {
        return TechnicianCard(
          userID: widget.userID,
          technician: tvTechnicians![index],
        );
      },
    );
  }

  Widget buildRefrigerator() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemCount: refrigeratorTechnicians!.length,
      itemBuilder: (context, index) {
        return TechnicianCard(
          userID: widget.userID,
          technician: refrigeratorTechnicians![index],
        );
      },
    );
  }

  Widget buildWashingMachine() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemCount: washingMachineTechnicians!.length,
      itemBuilder: (context, index) {
        return TechnicianCard(
          userID: widget.userID,
          technician: washingMachineTechnicians![index],
        );
      },
    );
  }

  Widget buildAirConditioner() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemCount: airConditionerTechnicians!.length,
      itemBuilder: (context, index) {
        return TechnicianCard(
          userID: widget.userID,
          technician: airConditionerTechnicians![index],
        );
      },
    );
  }

  Widget buildOtherAppliances() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemCount: otherTechnicians!.length,
      itemBuilder: (context, index) {
        return TechnicianCard(
          userID: widget.userID,
          technician: otherTechnicians![index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListView(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset("assets/images/8.png"),
                      const SizedBox(
                        width: 260,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chat_outlined),
                        tooltip: "Chat",
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none_rounded),
                        tooltip: "Notification",
                      )
                    ],
                  ),
                  const Text(
                    "   Good Morning!",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "  $username",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: formkey,
                    child: AppTextFormField(
                      controller: searchController,
                      hintText: "Search",
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        size: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TabBar(
                    overlayColor: WidgetStatePropertyAll(Colors.grey[300]),
                    indicatorColor: Colors.black,
                    controller: tabController,
                    splashBorderRadius: BorderRadius.circular(40),
                    tabs: const [
                      Tab(
                        height: 45,
                        child: ImageIcon(
                          AssetImage("assets/images/tv.png"),
                          color: Colors.black,
                          size: 28,
                          semanticLabel: "TV",
                        ),
                      ),
                      Tab(
                        height: 45,
                        child: ImageIcon(
                          AssetImage("assets/images/refrigerator.png"),
                          color: Colors.black,
                          size: 28,
                          semanticLabel: "Refrigerator",
                        ),
                      ),
                      Tab(
                        height: 45,
                        child: ImageIcon(
                          AssetImage("assets/images/washing-machine.png"),
                          color: Colors.black,
                          size: 28,
                          semanticLabel: "Washing Machine",
                        ),
                      ),
                      Tab(
                        height: 45,
                        child: ImageIcon(
                          AssetImage("assets/images/air-conditioner_1.png"),
                          color: Colors.black,
                          size: 30,
                          semanticLabel: "Air Conditioner",
                        ),
                      ),
                      Tab(
                        height: 45,
                        child: ImageIcon(
                          AssetImage("assets/images/home-appliance.png"),
                          size: 28,
                          color: Colors.black,
                          semanticLabel: "Other appliances",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 455,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        buildTv(),
                        buildRefrigerator(),
                        buildWashingMachine(),
                        buildAirConditioner(),
                        buildOtherAppliances()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 310,
            top: 735,
            child: PostButton(
              userID: widget.userID,
            ),
          )
        ],
      ),
    );
  }
}
