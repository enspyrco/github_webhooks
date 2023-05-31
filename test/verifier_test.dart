import 'package:github_webhooks/github_webhooks.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:test/test.dart';

import 'data/example_body.dart';

Response _echoRequest(Request request) =>
    Response.ok('Request for "${request.url}"');

/// The verifyGitHubSignature middleware ...
void main() {
  group('verifyGitHubSignature middleware', () {
    test('correctly identifies a valid signature', () async {
      // When we use the correct key (in the sense that the signature was
      // generated from the body using the key), the signatures match
      // and no exception is thrown

      final handler2 = const Pipeline()
          .addMiddleware(verifyGitHubSignature('right key'))
          .addHandler(_echoRequest);

      final server2 = await serve(handler2, 'localhost', 8080);

      // TODO: Create a request with signature1, body1 from test/data/example_body.dart
      // TODO: Expect middleware doesn't throw an exception
    });

    test('correctly identifies an invalid signature', () async {
      // the signatures won't match because we used the wrong key

      final handler1 = const Pipeline()
          .addMiddleware(verifyGitHubSignature('wrong key'))
          .addHandler(_echoRequest);

      final server1 = await serve(handler1, 'localhost', 8080);

      // TODO: Create a request with signature1, body1 from test/data/example_body.dart
      // TODO: Expect middleware throws an exception
    });
  });
}
