import 'package:brijith/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CommonController extends GetxController {
  final customerRequestedQty = TextEditingController().obs;
  final marketRate = TextEditingController().obs;
  final gsm = TextEditingController().obs;
  RxString ups = "".obs;
  RxString ratePerSheet = "".obs;
  final machinePaperSize =
      [TextEditingController(), TextEditingController()].obs;
  final requestedPaperSize =
      [TextEditingController(), TextEditingController()].obs;

  onCalculateButtonClick() {
    ups.value = optimumQuantity(
            double.parse(machinePaperSize[0].value.text.toString()),
            double.parse(machinePaperSize[1].value.text.toString()),
            double.parse(requestedPaperSize[0].value.text.toString()),
            double.parse(requestedPaperSize[1].value.text.toString()))
        .toString();
    ratePerSheet.value = calculateRatePerSheet(
            double.parse(machinePaperSize[0].value.text),
            double.parse(machinePaperSize[1].value.text),
            int.parse(gsm.value.text),
            double.parse(marketRate.value.text))
        .toString();
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

  double calculateRatePerSheet(
      double paperHeight, double paperWidth, int gsmSize, double matrketRate) {
    return (paperHeight * paperWidth) * (gsmSize) * (matrketRate) / divisor;
  }
}
