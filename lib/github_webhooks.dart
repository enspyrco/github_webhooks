/// Helper functions for Dart microservices responding to GitHub webhooks.
///
/// AuthService
///  Verify the sender using a secret key to calculate a signature from the
///  body and compare it with the signature that was also sent with the request.
///
library;

export 'src/extensions/json_map_extensions.dart';
export 'src/middleware/verify_git_hub_signature.dart';
