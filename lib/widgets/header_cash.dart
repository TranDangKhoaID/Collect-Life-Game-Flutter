import 'package:collect_life_game/common/share_color.dart';
import 'package:collect_life_game/common/share_obs.dart';
import 'package:collect_life_game/extensions/string.dart';
import 'package:flutter/material.dart';

class HeaderCash extends StatelessWidget {
  const HeaderCash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: ShareColors.kPrimaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              child: Text(
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
          Container(
            margin: const EdgeInsets.only(right: 1),
            padding: const EdgeInsets.symmetric(horizontal: 7),
            decoration: BoxDecoration(
              color: ShareColors.kPrimaryColor,
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                '+',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
