import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return const Scaffold(
      body: SafeArea(
        child: SizedBox(
          child:  Center(
            child: Text('More Screen'),
          ),
        ),
      ),
    );
  }
}
