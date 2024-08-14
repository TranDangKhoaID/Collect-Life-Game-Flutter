import 'package:collect_life_game/common/share_color.dart';
import 'package:collect_life_game/common/share_obs.dart';
import 'package:collect_life_game/extensions/string.dart';
import 'package:collect_life_game/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderCash extends StatelessWidget {
  const HeaderCash({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoute.tradeCashScreen),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: ShareColors.kPrimaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Icon(
                Icons.money,
                color: ShareColors.kPrimaryColor,
              ),
            ),
            Expanded(
              child: Center(
                child: Obx(
                  () => Text(
                    formattedNumber(ShareObs.cash.value),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: ShareColors.kPrimaryColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
