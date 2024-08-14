import 'package:collect_life_game/common/share_obs.dart';
import 'package:collect_life_game/screens/home/controller/home_controller.dart';
import 'package:collect_life_game/widgets/header_cash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const HeaderCash(),
              const Spacer(),
              // GestureDetector(
              //   onTap: () {
              //     _controller.deleteAllCoin();
              //   },
              //   child: Container(
              //     color: Colors.red,
              //     height: 50,
              //     child: Text('Hi'),
              //   ),
              // ),
              Column(
                children: [
                  // Obx(
                  //   () => Text(
                  //     '${ShareObs.energy.value}/100',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 20,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  Text(
                    'Nhấp, nhấp nữa, nhấp mãi',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  _controller.pickItemLocal();
                },
                child: Image.asset(
                  width: 200,
                  'assets/images/chest.webp',
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
