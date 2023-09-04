import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesis_v2_app/presentation/providers/auth/auth_service_provider.dart';
import 'package:tesis_v2_app/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return const Scaffold(
      body: _CustomLogin(),
    );
  }
}

class _CustomLogin extends StatelessWidget {
  const _CustomLogin();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
        Colors.blue.shade900,
        Colors.blue.shade800,
        Colors.blue.shade400,
      ])),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Iniciar Sesion',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                Text(
                  'Bienvenido',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Expanded(
              child: Container(
            width: size.width * 1,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60), topRight: Radius.circular(60)),
            ),
            child: const Padding(
              padding: EdgeInsets.all(30),
              child: _FormLogin(),
            ),
          ))
        ],
      ),
    );
  }
}

class _FormLogin extends StatefulWidget {
  const _FormLogin();

  @override
  State<_FormLogin> createState() => __FormLoginState();
}

class __FormLoginState extends State<_FormLogin> {
  //Text controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //Registrarse
  void login() async {
    final authService =
        Provider.of<AuthServiceProvider>(context, listen: false);
    try {
      final bool res = await authService.Login(
          usernameController.text, passwordController.text);
      if (res) {
        Navigator.pushNamed(context, '/home');
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        SizedBox(
          height: size.height * 0.04,
        ),
        Container(
          width: size.width * 1,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(255, 6, 83, 156),
                    blurRadius: 10,
                    offset: Offset(0, 2))
              ]),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200))),
                child: MyTextField(
                  controller: usernameController,
                  hintText: 'Dni',
                  obscureText: false,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200))),
                child: MyTextField(
                  controller: passwordController,
                  hintText: 'Contraseña',
                  obscureText: true,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          "Olvido la contraseña?",
          style: TextStyle(color: Color.fromARGB(255, 58, 58, 58)),
        ),
        const SizedBox(
          height: 40,
        ),
        MyButtonForm(
          text: 'Iniciar Sesión',
          onTap: () {
            login();
          },
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('No tienes una cuenta?'),
            const SizedBox(
              width: 4.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text(
                'Registrate ahora',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 0, 103, 187)),
              ),
            )
          ],
        )
      ],
    );
  }
}
