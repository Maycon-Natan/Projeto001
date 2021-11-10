import 'package:flutter/material.dart';
import 'package:projeto001/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.people,
            size: MediaQuery.of(context).size.height * 0.3,
          ),
          TextField(
            decoration: const InputDecoration(
              label: Text('Login'),
            ),
            onChanged: _controller.setLogin,
          ),
          TextField(
            decoration: const InputDecoration(
              label: Text('Senha'),
            ),
            onChanged: _controller.setPass,
            obscureText: true,
          ),
          const SizedBox(
            height: 15,
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _controller.inLoader,
            builder: (_, inLoader, __) => inLoader
                ? const CircularProgressIndicator(
                    color: Colors.blue,
                  )
                : ElevatedButton(
                    onPressed: () {
                      _controller.auth().then((result) {
                        if (result) {
                          Navigator.of(context).pushReplacementNamed('/home');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Falha ao realizar login'),
                                  duration: Duration(seconds: 5)));
                        }
                      });
                    },
                    child: const Text('Login'),
                  ),
          ),
        ],
      ),
    ));
  }
}