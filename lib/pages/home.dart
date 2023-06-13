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
        physics: const BouncingScrollPhysics(),
        child: Form(
          
          key: controller.formKey,
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
                              hintText: "Order",
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
                              hintText: "Rate",
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
                              hintText: "GSM",
                              controller: controller.gsm.value,
                            )))
                  ],
                )),
              ),
              SizedBox(
                height: size.height * 0.2,
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
                              controller: controller.machinePaperSize[0],
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
                              controller: controller.machinePaperSize[1],
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
                height: size.height * 0.2,
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
                              controller: controller.requestedPaperSize[0],
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
                              controller: controller.requestedPaperSize[1],
                              hintText: "Width",
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
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
                        "Extras",
                        style: commonTextStyle,
                      ),
                    )),
                    Flexible(
                        child: SizedBox(
                            height: 80,
                            child: CustomFormField(
                              hintText: "Xtras",
                              controller: controller.extras.value,
                            )))
                  ],
                )),
              ),
              Obx(() => Container(
                    height: size.height * .25,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    width: size.width,
                    decoration: const BoxDecoration(
                      border: Border(),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const Text("Rate Per Sheets",
                                      textAlign: TextAlign.center),
                                  Text(
                                    controller.ratePerSheet.value,
                                    style: commonTextStyle.copyWith(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Text("Calculated UP's ",
                                      textAlign: TextAlign.center),
                                  Text(
                                    controller.ups.value,
                                    style: commonTextStyle.copyWith(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Text("Required Sheets",
                                      textAlign: TextAlign.center),
                                  Text(
                                    controller.requiredSheets.value,
                                    style: commonTextStyle.copyWith(
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 8.0),
                                      child: Text("Total Amount"),
                                    ),
                                    Text(
                                      controller.result.value,
                                      style: commonTextStyle.copyWith(
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 8.0),
                                      child: Text("Per Copy"),
                                    ),
                                    Text(
                                      controller.ratePerCopy.value,
                                      style: commonTextStyle.copyWith(
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ElevatedButton(
                    onPressed: () {
                      controller.onCalculateButtonClick();
                    },
                    child: const Text("Calculate")),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
