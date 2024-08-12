import 'package:flutter/material.dart';

class PickMoneyScreen extends StatefulWidget {
  const PickMoneyScreen({super.key});

  @override
  State<PickMoneyScreen> createState() => _PickMoneyScreenState();
}

class _PickMoneyScreenState extends State<PickMoneyScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hái vàng'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              width: double.infinity,
              'assets/images/bg_pick_money.png',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('tap_the_tree_to_pick_gold'),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    width: 200,
                    'assets/images/money-tree.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
