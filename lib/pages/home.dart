import 'package:brijith/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("C A L C U L A T E - M E"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.2,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Paper Size To Feed On the Machine"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: const [
                      Flexible(flex: 1, child: CustomFormField()),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "X",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(flex: 1, child: CustomFormField())
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
