import 'package:imgflip_api/imgflip_api.dart';

void main() async {
  /// Retrieves a list of available memes from the ImgFlip API.
  final memes = await ImgFlip.getMemes();

  print("Generating meme with template ID: ${memes.first.id}");

  /// Generates a meme using the specified template ID and texts.
  ImgFlip(
    username: 'YOUR USERNAME',
    password: 'YOUR PASSWORD',
  ).generateMeme(templateId: memes.first.id, texts: ['Hello', 'World']).then(
      (url) {
    print(url);
  });
}
