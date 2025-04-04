import 'package:easy_localization/easy_localization.dart';
import 'package:solano_app/app/l10n/app_l10n.g.dart';
import 'package:solano_app/core/utils/logger/logger_utils.dart';


mixin TranslationMixin {
  String translate(String key) {
    final value = key.toLowerCase().replaceAll(' ', '_');
    LoggerUtils.instance.logError('Error message from tranlate method  $value');

    switch (value) {
      case 'user_already_exists':
        return LocaleKeys.failure_user_already_exists.tr();
      case 'user_not_found':
        return LocaleKeys.failure_user_not_found.tr();
      case 'invalid_credentials':
        return LocaleKeys.failure_invalid_credentials.tr();

      default:
        return key;
    }
  }
}
