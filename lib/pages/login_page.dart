import 'package:flutter/material.dart';
import 'package:list_app/routes/routes.dart';
import 'package:get/get.dart';

//stfl +enter
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //day  1
  String statusLogin = "Login status";
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),

      //body ; column klik, klik lampu, ubah jadi conatiner
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // ngatur posisi text
          children: [
            Text(
              "Welcome To Our APPPP",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),

            //gambar
            Center(
              child: Container(
                width: double.tryParse('200'),
                child: Image.asset('assets/pohon.png'),
              ),
            ),
            Text("Fill Username and password :"), //text
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: TextField(
                controller: txtUsername,
                decoration: InputDecoration(
                  hintText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            //hint / label, border
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: TextField(
                controller: txtPassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "password",
                  border: OutlineInputBorder(),
                ),
              ), //password hidden
            ),

            //button
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (txtUsername.text == "admin" &&
                      txtPassword.text == "admin123") {
                    Get.toNamed(
                    AppRoutes.profilePage,
                  );
                    statusLogin = "sukses login";
                  } else {
                    statusLogin = "gagal login";
                  }
                  print("status " + statusLogin);
                },
                child: Text("Login"),
              ),
            ),
            Text(statusLogin),
          ],
        ),
      ),
    );
  }
}
