import 'package:flutter_easyloading/flutter_easyloading.dart';

void loadingLoad({required status}) {
  EasyLoading.show(
    status: "$status",
    maskType: EasyLoadingMaskType.black,
  );
}

void loadingFail({required status}) {
  EasyLoading.showError("$status",
      maskType: EasyLoadingMaskType.black,
      duration: const Duration(seconds: 2));
}

void loadingSuccess({required status}) {
  EasyLoading.showSuccess("$status",
      maskType: EasyLoadingMaskType.black, duration: const Duration(seconds: 2));
}
