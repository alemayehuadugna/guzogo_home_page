// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guzogo/global_variables.dart';

class AddressSelector extends StatefulWidget {
  AddressSelector({
    super.key,
    required this.isFrom,
  });

  bool isFrom;

  @override
  State<AddressSelector> createState() => _AddressSelectorState();
}

class _AddressSelectorState extends State<AddressSelector> {
  var location = [
    {"city": "Abidjan", "air_port": "Port Bouet Airport", "short": "ABJ"},
    {
      "city": "Abuja",
      "air_port": "Nnamdi Azikiwe International Airport",
      "short": "ABV"
    },
    {
      "city": "Accra",
      "air_port": "Kotoka International Airport",
      "short": "ACC"
    },
    {
      "city": "Ad Damman",
      "air_port": "King Fahd International Airport",
      "short": "DMM"
    },
    {
      "city": "Addis Abeba",
      "air_port": "Bole International Airport",
      "short": "ADD"
    },
    {"city": "Antananarivo", "air_port": "Ivato Airport", "short": "TNR"},
    {"city": "Asosa", "air_port": "Asosa Aiport", "short": "ASO"},
    {"city": "Bahir Dar", "air_port": "Bahir Dar Airport", "short": "BJR"},
    {
      "city": "Athens",
      "air_port": "Eleftherios Venizelos International Airport",
      "short": "ATH"
    },
    {"city": "Awassa", "air_port": "Awassa Aiport", "short": "AWA"},
  ];
  TextEditingController? seachController;
  var searchNode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 60, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Select Airport",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
              child: TextFormField(
                controller: seachController,
                cursorColor: Colors.blue,
                enabled: true,
                keyboardType: TextInputType.name,
                focusNode: searchNode,
                decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: const Color.fromARGB(255, 236, 233, 233),
                  contentPadding: const EdgeInsets.only(top: 20.0),

                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Color.fromARGB(255, 236, 233, 233)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color.fromARGB(255, 236, 233, 233),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color.fromARGB(255, 236, 233, 233),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  alignLabelWithHint: true,
                  hintText: "Search",
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(207, 207, 207, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
                onChanged: (text) async {},
              ),
            ),
            const SizedBox(height: 15),
            const Divider(
              indent: 1,
              color: Color.fromRGBO(218, 217, 217, 1),
              endIndent: 1,
              thickness: 2,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Direct Airports",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 232,
                    child: ListView.builder(
                        itemCount: location.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (widget.isFrom) {
                                  short = location[index]['short']!;
                                  city = location[index]['city']!;
                                  air_port = location[index]['air_port']!;
                                } else {
                                  toShort = location[index]['short']!;
                                  toCity = location[index]['city']!;
                                  toAirPort = location[index]['air_port']!;
                                }
                                Navigator.pop(context);
                              });
                            },
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      child: Transform.rotate(
                                        angle: -90 * pi / 130,
                                        child: const Icon(
                                          Icons.flight,
                                          size: 25,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                        child: Text(
                                            "${location[index]['city']!}, "
                                            "${location[index]['air_port']!} "
                                            "( ${location[index]['short']!} )"))
                                  ],
                                ),
                                const SizedBox(height: 7),
                                const Divider(
                                  indent: 1,
                                  color: Color.fromRGBO(218, 217, 217, 1),
                                  endIndent: 1,
                                  thickness: 2,
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
