# ImgFlip API

This project provides a Dart library for interacting with the ImgFlip API. It allows you to retrieve a list of available memes and generate custom memes using the ImgFlip service.

## Installation

To use this library in your Dart project, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  imgflip: ^1.0.0
```

Then, run `pub get` to download and install the package.

## Usage

To use this library, you first need to import it:

```dart
import 'package:imgflip/imgflip.dart';
```

Then, you can create an instance of the `ImgFlip` class and use it to interact with the ImgFlip API:

```dart
final imgFlip = ImgFlip('your_username', 'your_password');
```

### Retrieving a list of available memes

To retrieve a list of available memes, you can use the `getMemes` method:

```dart
final memes = await imgFlip.getMemes();
print(memes);
```

### Generating a custom meme

To generate a custom meme, you can use the `generateMeme` method:

```dart
final meme = await imgFlip.generateMeme('meme_id', 'top_text', 'bottom_text');
print(meme);
```
