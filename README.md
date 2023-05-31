# github_webhooks

Helper functions for Dart microservices responding to GitHub webhooks.

## Features

### verifyGitHubSignature Middleware

Verify the sender was GitHub by using a secret key to calculate a signature from the body and compare it with the signature that was also sent with the request.

## Getting started

Get the webhook secret from ...

Add an environment variable named WEBHOOK_SECRET with:

- on Cloud Run
  - a

- on Compute Engine
  - a

- Locally
  - a

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
