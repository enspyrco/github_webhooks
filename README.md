# github_webhooks

Helper functions for Dart microservices responding to GitHub webhooks.

## Features

### verifyGitHubSignature Middleware

Verify the sender was your outgoing webhook from GitHub by using a secret key to generate a signature from the body and compare it with the signature that was also sent with the request.

## Getting started

See [Securing your webhooks - GitHub Docs](https://docs.github.com/en/webhooks-and-events/webhooks/securing-your-webhooks) for how to generate and store a key (in this case the key is just a random string with high entropy).

You then need to provide the `verifyGitHubSignature` Middleware with the same key. How to do so is up to you and will depend on yor security requirements. One way is to add an environment variable that is provided by a Secret Manager (see [TODO: link to a Tutorial]).

## Usage

Use `verifyGitHubSignature()` in a shelf Pipeline like this:

```dart
final requestHandler = const Pipeline()
  .addMiddleware(verifyGitHubSignature(Platform.environment['WEBHOOK_SECRET']!))
  .addHandler(_yourHandler);

final server = await serve(requestHandler, 'localhost', 8080);
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
