import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String username = "";
  String password = "";
  bool isLoading = false;
  bool obscure = true;

  void login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    await Future.delayed(Duration(seconds: 1));

    setState(() => isLoading = false);

    if (username == "25102004" && password == "piuxinh23") {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sai tài khoản hoặc mật khẩu")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.lock,
                          size: 80, color: Colors.blue),
                      SizedBox(height: 10),

                      Text("Đăng nhập",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),

                      SizedBox(height: 20),

                      // USERNAME
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Tài khoản",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(12)),
                        ),
                        onChanged: (v) => username = v,
                        validator: (v) =>
                        v!.isEmpty ? "Nhập tài khoản" : null,
                      ),

                      SizedBox(height: 15),

                      // PASSWORD
                      TextFormField(
                        obscureText: obscure,
                        decoration: InputDecoration(
                          labelText: "Mật khẩu",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(obscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() => obscure = !obscure);
                            },
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(12)),
                        ),
                        onChanged: (v) => password = v,
                        validator: (v) =>
                        v!.length < 6 ? "Ít nhất 6 ký tự" : null,
                      ),

                      SizedBox(height: 20),

                      isLoading
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize:
                          Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: login,
                        child: Text("Đăng nhập"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}