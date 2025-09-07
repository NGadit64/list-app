import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTodo extends StatelessWidget{
  const AddTodo ({super.key});
  
  

@override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/pohon.png"), // contoh
            ),
            SizedBox(height: 20),
            Text("Username: Aditya",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Email: jayakusuma@gemali.com"),
          ],
        ),
      ),
    );
  }
}
