import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/widgets.dart';
import 'package:validators2/validators2.dart';
import 'package:easy_localization/easy_localization.dart';

class ValidatorHook {
  final String? Function(String?) validate;
  final ValueNotifier<String?> error;

  ValidatorHook({required this.validate, required this.error});
}

ValidatorHook useValidator(String? Function(String?) validatorFn) {
  final error = useState<String?>(null);

  String? validate(String? value) {
    final result = validatorFn(value);
    error.value = result;
    return result;
  }

  return ValidatorHook(validate: validate, error: error);
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) return 'email_required'.tr();
  if (!isEmail(value)) return 'email_invalid'.tr();
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) return 'password_required'.tr();
  if (value.length < 6) return 'password_short'.tr();
  return null;
}

String? nameValidator(String? value) {
  if (value == null || value.isEmpty) return 'name_required'.tr();
  if (value.length < 2) return 'name_short'.tr();
  return null;
}
