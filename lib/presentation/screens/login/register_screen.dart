import 'package:flutter/material.dart';
import 'package:tesis_v2_app/presentation/widgets/formularios/my_button_form.dart';
import 'package:tesis_v2_app/presentation/widgets/formularios/my_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CurvedContainer(),
    );
  }
}

class CurvedContainer extends StatelessWidget {
  const CurvedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(children: [
      ClipPath(
        clipper: MyClipper(),
        child: Container(
          color: Colors.blue.shade900,
          height: 200,
          child: SizedBox(
              width: size.width * 0.1,
              child: const Center(
                  child: Text(
                'Registro',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ))),
        ),
      ),
      SizedBox(
        height: size.height * 0.07,
      ),
      //Formulario Registro
      _FormRegister()
    ]);
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height / 2);
    // path.quadraticBezierTo(
    //     size.width / 2, size.height, size.width, size.height - 50);

    path.cubicTo(size.width / 4, 3 * (size.height / 2), 3 * (size.width / 4),
        size.height / 2, size.width, size.height * 0.9);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _FormRegister extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
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
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200))),
                      child: MyTextField(
                          controller: usernameController,
                          hintText: 'DNI',
                          obscureText: false)),
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200))),
                      child: MyTextField(
                          controller: passwordController,
                          hintText: 'Contraseña',
                          obscureText: true)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: MyButtonForm(
              text: 'Registrate',
              onTap: () {},
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Ya tienes una cuenta?'),
              const SizedBox(
                width: 4.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Text(
                  'Inicia Sesión',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Color.fromARGB(255, 0, 103, 187)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
