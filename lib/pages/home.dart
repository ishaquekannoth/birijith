import 'package:brijith/constants/constants.dart';
import 'package:brijith/controllers/controller.dart';
import 'package:brijith/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommonController());
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("C A L C U L A T E - M E"),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Flexible(
                        child: Text(
                      "Customer Requested QTY",
                      style: commonTextStyle,
                    )),
                    Flexible(child: CustomFormField())
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Flexible(
                        child: Text(
                      "Current Market Rate",
                      style: commonTextStyle,
                    )),
                    Flexible(child: CustomFormField())
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Flexible(
                        child: Text(
                      "GSM",
                      style: commonTextStyle,
                    )),
                    Flexible(child: CustomFormField())
                  ],
                )),
              ),
              SizedBox(
                height: size.height * 0.16,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Paper Size To Feed On the Machine",
                        style: commonTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: CustomFormField(
                                controller:
                                    controller.machinePaperSize.value[0],
                                hintText: "Height",
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "X",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                              flex: 1,
                              child: CustomFormField(
                                controller:
                                    controller.machinePaperSize.value[1],
                                hintText: "Width",
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.16,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Customer Requested Size",
                          style: commonTextStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: CustomFormField(
                                controller:
                                    controller.requestedPaperSize.value[0],
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "X",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                              flex: 1,
                              child: CustomFormField(
                                  controller:
                                      controller.requestedPaperSize.value[1]))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    controller.onCalculateButtonClick();
                  },
                  child: const Text("Calculate"))
            ],
          ),
        ),
      ),
    ));
  }
}
