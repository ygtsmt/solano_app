import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'env/.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'BASE_URL')
  static final String baseUrl = _Env.baseUrl;
  @EnviedField(varName: 'GOOGLE_CLIENTID')
  static final String googleClientId = _Env.googleClientId;
  @EnviedField(varName: 'GOOGLE_SECRET')
  static final String googleSecret = _Env.googleSecret;
 
}
