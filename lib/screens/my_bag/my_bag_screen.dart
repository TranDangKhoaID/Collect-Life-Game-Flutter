import 'package:cached_network_image/cached_network_image.dart';
import 'package:collect_life_game/locator.dart';
import 'package:collect_life_game/service/item_db.dart';
import 'package:collect_life_game/widgets/shimmer_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyBagScreen extends StatefulWidget {
  const MyBagScreen({super.key});

  @override
  State<MyBagScreen> createState() => _MyBagScreenState();
}

class _MyBagScreenState extends State<MyBagScreen> {
  //
  final _itemDB = locator<ItemDB>();
  @override
  void initState() {
    super.initState();
    _itemDB.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _itemDB.fetchAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  final item = snapshot.data![index];
                  return GridTile(
                    footer: Text('x${item.quantity}'),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl: item.img ?? '',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const ShimmerImage(),
                          // errorWidget: (context, url, error) => Image.asset(
                          //   'assets/images/error_photo.png',
                          // ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
