## Features

This package is an "extension" of the flutter_secure_storage package to use cookie storage instead of session storage.

## Getting started

Clones this project, then adds it to the package directory of your flutter application.

Then add packages to your configuration:
```yaml
  secure_storage:
    path: "your/path/secure_storage"

```

Run the command:
```bash
  flutter pub get
```

## Usage
To instantiate the object:
```dart
import "package:secure_storage/secure_storage.dart";

// You logic

final SecureStorage _storage = SecureStorage();
```

To find out if a key exists:
```dart
_storage.containsKey(key: "you-key");
```

To delete a key:
```dart
_storage.delete(key: "you-key");
```

To delete all keys:
```dart
_storage.deleteAll();
```

To read a key:
```dart
_storage.read(key: "you-key");
```

To read all keys:
```dart
_storage.readAll();
```

To write a key-value pair :
```dart
_storage.write(key: "you-key", value: "you-value");
```
