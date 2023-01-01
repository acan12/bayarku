import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      context.pushReplacement("/$routeBoardingOne");
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => const Boarding1Page()),
      //     result: (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.green,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      backgroundColor: Colors.green,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Center(
            child: Text(
          "Welcome",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        )),
        Container(
            margin: const EdgeInsets.only(top: 20),
            child: const CircularProgressIndicator(
              color: Colors.white,
            )),
      ]),
    );
  }
}
