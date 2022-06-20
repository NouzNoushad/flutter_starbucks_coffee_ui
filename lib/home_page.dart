import 'package:flutter/material.dart';
import 'package:star_buck_ui/coffee_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> sizes = ["S", "M", "L"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          customAppBarDesign(),
          headerSection(),
          const StarBuckCoffeeDetails(),
        ],
      ),
    );
  }

  Widget headerSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://freepngimg.com/thumb/starbucks/77325-frappuccino-drink-chocolate-starbucks-matcha-white-thumb.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Size",
                style: TextStyle(
                  color: Colors.green.shade900,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 80,
                width: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sizes.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 15),
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: Colors.green.shade900),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        sizes[index],
                        style: TextStyle(
                          color: Colors.green.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget customAppBarDesign() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            height: 25,
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.green.shade900),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 12,
                  color: Colors.green.shade900,
                ),
                Text(
                  "Back",
                  style: TextStyle(
                    color: Colors.green.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.green.shade900),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
