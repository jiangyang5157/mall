import 'package:mall/core/util/validation/regex_validator.dart';
import 'package:mall/core/util/validation/validator.dart';

/// Validate given data, returns error message key or null if the data is valid.
class EmailAddressValidator implements Validator<String, String> {
  final RegexValidator regexValidator =
      RegexValidator('^[a-zA-Z0-9._]+@[a-zA-Z0-9-]+\.[a-zA-Z]+\$');

  @override
  String validate(String data) {
    if (data.length <= 0) {
      return 'error_empty_email_address';
    }
    if (!regexValidator.validate(data)) {
      return 'error_invalid_email_address';
    }
    return null;
  }
}
