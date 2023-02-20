import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toonflix/screens/home_screen.dart';

class GetInfoScreen extends StatefulWidget {
  const GetInfoScreen({super.key});

  @override
  State<GetInfoScreen> createState() => _GetInfoScreenState();
}

class _GetInfoScreenState extends State<GetInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('Makeat'),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.white,

        foregroundColor: Colors.black,
        title: SizedBox(width: 40, child: Image.asset('images/logo.png')),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const DataForm(
                  name: '나이',
                  isNumber: true,
                ),
                const DataForm(
                  name: '키',
                  isNumber: true,
                ),
                const DataForm(
                  name: '몸무게',
                  isNumber: true,
                ),
                const DataForm(
                  name: '목표',
                  isNumber: false,
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('환영합니다!')),
                      // );
                    }
                  },
                  child: const Text('시작하기'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DataForm extends StatelessWidget {
  final String name;
  final bool isNumber;

  const DataForm({Key? key, required this.name, required this.isNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text('$name :   '),
      SizedBox(
        width: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: TextField(
            decoration: const InputDecoration(border: OutlineInputBorder()),
            keyboardType: isNumber ? TextInputType.number : TextInputType.name,
            controller: TextEditingController(),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
            ],
          ),
        ),
      ),
    ]);
  }
}
