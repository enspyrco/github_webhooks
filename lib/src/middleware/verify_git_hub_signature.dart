import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:crypto/crypto.dart';

/// Validate the request - if signatures don't match throw exception.
///
/// The [key] is a secret manually added to GitHub to be used by the webhooks
/// and will usually be stored somewhere secure such as a Secret Manager then
/// retrieved on the server and passed in to this middleware.
Middleware verifyGitHubSignature(String key) => (Handler innerHandler) {
      return (Request request) async {
        final body = await request.readAsString();
        final signature = request.headers['X-Hub-Signature-256'];

        /// Verify sender by using the secret key to calculate a signature from the body
        /// and compare it with the signature that was also sent with the request.
        final bodyBytes = utf8.encode(body);
        final encodedKey = utf8.encode(key);
        final digest = Hmac(sha256, encodedKey).convert(bodyBytes);

        final calculatedSignature = 'sha256=$digest';
        if (calculatedSignature != signature) {
          throw SignatureMismatchException();
        }

        return innerHandler(request);
      };
    };

class SignatureMismatchException implements Exception {}
