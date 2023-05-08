// Let's assume we have different configuration for production & staging
// For the security purpose we also can add it to .gitignore


/// Staging environment
class EnvironmentConfig {
  const EnvironmentConfig._();

  static const String activeEnvironment = 'staging';
  static const String apiKey = '4230c52b297a48c0b8a55c8546ff9114';
  static const String apiUrl = 'https://api.rawg.io/api/games/';
}


/// Production environment
// class EnvironmentConfig {
//   const EnvironmentConfig._();
//
//   static const String activeEnvironment = 'production';
//   static const String apiKey = '02ef6ba5d13444ee86bad607e8bce3f4';
//   static const String apiUrl = 'https://api.rawg.io/api/games/';
// }