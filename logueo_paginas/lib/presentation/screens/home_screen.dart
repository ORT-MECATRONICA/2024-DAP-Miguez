import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  final String user;
  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome $user",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
              ElevatedButton(
                onPressed: (){
                  context.go('/login');
                }, 
                child: const Text("Logout")
              ),
            ],
          )
        )
    );
  }
}