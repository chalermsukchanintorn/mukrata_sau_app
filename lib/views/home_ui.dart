// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mukrata_sau_app/views/about_ui.dart';
import 'package:mukrata_sau_app/views/calculate_pay_bill_ui.dart';
import 'package:mukrata_sau_app/views/menu_shop_ui.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  //สร้างตัวแปรเก็บหน้าจอ (ui) ที่จะใช้กับ BottomBar
  List<Widget> _currentShow = [
    CalculatePayBillUI(),
    MenuShopUI(),
    AboutUI(),
  ];

  //สร้างตัวแปรกำหนดหน้าจอที่จะแสดงสำหรับ BottomBar
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Tech SAU BUFFET',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: ConvexAppBar(
        height: 70.0,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        initialActiveIndex: _currentIndex,
        backgroundColor: Colors.deepOrange,
        items: [
          TabItem(
            icon: Icon(
              FontAwesomeIcons.moneyBill1,
              color: Color.fromARGB(255, 200, 35, 21),
            ),
            title: 'คิดเงิน',
          ),
          TabItem(
            icon: Icon(
              Icons.home,
              color: Color.fromARGB(255, 200, 35, 21),
            ),
            title: 'HOME',
          ),
          TabItem(
            icon: Icon(
              FontAwesomeIcons.star,
              color: Color.fromARGB(255, 200, 35, 21),
            ),
            title: 'เกี่ยวกับ',
          ),
        ],
      ),
      body: _currentShow[_currentIndex],
    );
  }
}
