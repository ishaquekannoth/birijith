import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CommonController extends GetxController {
  final customerRequestedQty = TextEditingController().obs;
  final marketRate = TextEditingController().obs;
  final gsm = TextEditingController().obs;

  final machinePaperSize =
      [TextEditingController(), TextEditingController()].obs;
  final requestedPaperSize =
      [TextEditingController(), TextEditingController()].obs;

  onCalculateButtonClick() {
    print(optimumQuantity(
        double.parse(machinePaperSize[0].value.text.toString()),
        double.parse(machinePaperSize[1].value.text.toString()),
        double.parse(requestedPaperSize[0].value.text.toString()),
        double.parse(requestedPaperSize[1].value.text.toString())));
  }

  int optimumQuantity(
    double paperHeightM,
    double paperWidthM,
    double paperHeightC,
    double paperWidthC,
  ) {
    int quantity1 =
        (paperHeightM ~/ paperWidthC) + (paperWidthM ~/ paperHeightC);
    int quantity2 =
        (paperHeightM ~/ paperHeightC) + (paperWidthM ~/ paperWidthC);
    return quantity1 > quantity2 ? quantity1 : quantity2;
  }
}
