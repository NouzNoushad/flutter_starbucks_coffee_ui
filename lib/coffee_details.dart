import 'package:flutter/material.dart';
import 'package:star_buck_ui/model/percent.dart';

class StarBuckCoffeeDetails extends StatefulWidget {
  const StarBuckCoffeeDetails({Key? key}) : super(key: key);

  @override
  State<StarBuckCoffeeDetails> createState() => _StarBuckCoffeeDetailsState();
}

class _StarBuckCoffeeDetailsState extends State<StarBuckCoffeeDetails> {
  final List<String> items = [
    "Toasted Honey",
    "Caramel Drizzle",
    "Vanilla Powder",
    "Nutmeg"
  ];
  String selectedValue = "More";
  final List<Map<String, String>> toppingList = [
    {"topping1": "Chocolate Curls", "topping2": "Cocoa Powder"},
    {"topping1": "Pumpkin Spice", "topping2": "Smoked Sea Salt"},
    {"topping1": "Caramel Brulee", "topping2": "Chestnut Praline"},
  ];
  double value = 50;
  final List<Percentage> percentage = PercentageList;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 462,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green.shade900,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Topping",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isDense: true,
                          isExpanded: true,
                          iconEnabledColor: Colors.white.withOpacity(0.4),
                          hint: Text(
                            "More",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 16,
                            ),
                          ),
                          dropdownColor: Colors.green.shade900,
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 130,
                  child: ListView.builder(
                    itemCount: toppingList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            toppingListContainer(index, "topping1"),
                            toppingListContainer(index, "topping2"),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                toppingSlider(),
              ],
            ),
          ),
          Container(
            height: 65,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "place order".toUpperCase(),
                    style: TextStyle(
                      color: Colors.green.shade900,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$ 30.00",
                    style: TextStyle(
                      color: Colors.green.shade900,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget toppingSlider() {
    return Container(
      height: 210,
      child: ListView.builder(
        itemCount: percentage.length,
        itemBuilder: (context, index) {
          final percents = percentage[index];
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    percents.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${percents.percent.floor()}%",
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: SliderTheme(
                  data: SliderThemeData(
                    overlayShape: SliderComponentShape.noThumb,
                  ),
                  child: Slider(
                    min: 0,
                    max: 100,
                    activeColor: Colors.yellow,
                    inactiveColor: Colors.white,
                    thumbColor: Colors.white,
                    value: percents.percent,
                    onChanged: (newValue) {
                      setState(() {
                        percents.percent = newValue;
                      });
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget toppingListContainer(int index, String topping) {
    final toppings = toppingList[index];
    return Container(
      height: 30,
      width: 150,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        toppings[topping]!,
        style: TextStyle(
          color: Colors.green.shade900,
          fontSize: 14,
        ),
      ),
    );
  }
}
