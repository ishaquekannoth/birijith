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
                  children: [
                    const Flexible(
                        child: Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        "Customer Requested QTY",
                        style: commonTextStyle,
                      ),
                    )),
                    Flexible(
                        child: SizedBox(
                            height: 80,
                            child: CustomFormField(
                              controller: controller.customerRequestedQty.value,
                            )))
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                        child: Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        "Current Market Price",
                        style: commonTextStyle,
                      ),
                    )),
                    Flexible(
                        child: SizedBox(
                            height: 80,
                            child: CustomFormField(
                              controller: controller.marketRate.value,
                            )))
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                        child: Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        "GSM",
                        style: commonTextStyle,
                      ),
                    )),
                    Flexible(
                        child: SizedBox(
                            height: 80,
                            child: CustomFormField(
                              controller: controller.gsm.value,
                            )))
                  ],
                )),
              ),
              SizedBox(
                height: size.height * 0.15,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Paper To Machine",
                        style: commonTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                              child: SizedBox(
                            height: 80,
                            child: CustomFormField(
                              controller: controller.machinePaperSize.value[0],
                              hintText: "Height",
                            ),
                          )),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 25),
                            child: Text(
                              "X",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Flexible(
                              child: SizedBox(
                            height: 80,
                            child: CustomFormField(
                              controller: controller.machinePaperSize.value[1],
                              hintText: "Width",
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Customer Required dimensions",
                        style: commonTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                              child: SizedBox(
                            height: 80,
                            child: CustomFormField(
                              controller:
                                  controller.requestedPaperSize.value[0],
                              hintText: "Height",
                            ),
                          )),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 25),
                            child: Text(
                              "X",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Flexible(
                              child: SizedBox(
                            height: 80,
                            child: CustomFormField(
                              controller:
                                  controller.requestedPaperSize.value[1],
                              hintText: "Width",
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: size.width,
                  decoration:
                      const BoxDecoration(border: Border(), color: Colors.red),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(controller.ratePerSheet.value),
                      Text(controller.ups.value),
                    ],
                  ))),
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
