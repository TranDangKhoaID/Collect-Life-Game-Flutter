import 'package:collect_life_game/screens/trade_cash/controller/trade_cash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TradeCashScreen extends StatefulWidget {
  const TradeCashScreen({super.key});

  @override
  State<TradeCashScreen> createState() => _TradeCashScreenState();
}

class _TradeCashScreenState extends State<TradeCashScreen> {
  //controller
  final _controller = Get.put(TradeCashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đổi tiền'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('5 Gold Coin = 1.000.000'),
              TextButton(
                onPressed: () {
                  _controller.trade1(5);
                },
                child: Text(
                  'Đổi',
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
