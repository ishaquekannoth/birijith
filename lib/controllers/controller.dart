import 'package:brijith/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final customerRequestedQty = TextEditingController().obs;
  final marketRate = TextEditingController().obs;
  final gsm = TextEditingController().obs;
  final extras = TextEditingController().obs;
  RxString ups = "".obs;
  RxString ratePerSheet = "".obs;
  RxString requiredSheets = "".obs;
  RxString result = "".obs;
  RxString ratePerCopy = "".obs;
  final machinePaperSize =
      [TextEditingController(), TextEditingController()].obs;
  final requestedPaperSize =
      [TextEditingController(), TextEditingController()].obs;

  onCalculateButtonClick() {
    if (formKey.currentState!.validate()) {
      ups.value = optimumQuantity(
              double.parse(machinePaperSize[0].value.text.toString()),
              double.parse(machinePaperSize[1].value.text.toString()),
              double.parse(requestedPaperSize[0].value.text.toString()),
              double.parse(requestedPaperSize[1].value.text.toString()))
          .toString();
      requiredSheets.value = calculateRequiredSheets(
              int.parse(customerRequestedQty.value.text), int.parse(ups.value))
          .toString();
      ratePerSheet.value = calculateRatePerSheet(
              double.parse(machinePaperSize[0].value.text),
              double.parse(machinePaperSize[1].value.text),
              int.parse(gsm.value.text),
              double.parse(marketRate.value.text))
          .toString();
      result.value = resultCalculator(int.parse(requiredSheets.value),
              double.parse(ratePerSheet.value), double.parse(extras.value.text))
          .toString();
      ratePerCopy.value = ratePerCopyCalculator(
              double.parse(result.value),
              double.parse(customerRequestedQty.value.text),
              double.parse(extras.value.text))
          .toString();
    } else {
      Get.snackbar("Missing data", "please Fill all filelds");
    }
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

  int calculateRequiredSheets(int requestedQty, int requiredUps) {
    return requestedQty ~/ requiredUps;
  }

  double resultCalculator(
      int requiredSheet, double ratePerSheet, double extras) {
    return (requiredSheet * ratePerSheet) + extras;
  }

  double ratePerCopyCalculator(
      double totalAmount, double requestQty, double others) {
    return totalAmount / requestQty;
  }
}
