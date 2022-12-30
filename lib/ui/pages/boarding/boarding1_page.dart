import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import 'boarding2_page.dart';

class Boarding1Page extends ConsumerWidget {
  const Boarding1Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.zero,
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
          alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: SvgPicture.asset("images/dishes_favorites.svg"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                "All your favorites",
                style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 70),
              child: const Text(
                  "Order from the best local restaurants with easy, on-demand delivery.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SFProText',
                    color: Color(0xff868686),
                    fontSize: 16,
                  )),
            ),
            SvgPicture.asset("images/circle_first_indicator.svg"),
            Container(
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () => context.push("/$routeBoardingTwo"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: const Size.fromHeight(50)),
                    child: const Text("GET STARTED")))
          ]),
        )));
  }
}
