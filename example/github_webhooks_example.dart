import 'dart:io';

import 'package:github_webhooks/src/middleware/verify_git_hub_signature.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

void main() async {
  var handler = const Pipeline()
      .addMiddleware(
          verifyGitHubSignature(Platform.environment['WEBHOOK_SECRET']!))
      .addHandler(_echoRequest);

  var server = await serve(handler, 'localhost', 8080);

  // Enable content compression
  server.autoCompress = true;

  print('Serving at http://${server.address.host}:${server.port}');
}

Response _echoRequest(Request request) =>
    Response.ok('Request for "${request.url}"');
