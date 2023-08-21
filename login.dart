import 'package:flutter/material.dart';
import '/screens/home.dart';
import '/widgets/show_toast.dart';
import '/widgets/scroll_view.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  // ************ PREFILL ************
  @override
  void initState() {
    username.text = "user123";
    password.text = "pass123";
    return super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Login')),
      ),
      body: ScreenScroll(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
              child: TextField(
                controller: username,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Username",
                ),
                autocorrect: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
              child: TextField(
                controller: password,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Password",
                ),
                autocorrect: false,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: const Size(60, 40),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (username.text == "user123" &&
                        password.text == "pass123") {
                      showToast(context, "Succesfully logged in!");
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const Home(),
                      ));
                    } else {
                      showToast(context, "Incorrect username or password.");
                    }
                  },
                  child: const Text("Login"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
