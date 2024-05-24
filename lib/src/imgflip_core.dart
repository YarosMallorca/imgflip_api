import 'dart:convert';
import 'models/meme.dart';
import 'package:http/http.dart' as http;

/// A class that provides methods to interact with the ImgFlip API.
///
/// Username and password are required for authentication with the ImgFlip API.
/// Recommended to use Env variables for storing sensitive data.
class ImgFlip {
  /// The username used for authentication with the ImgFlip API.
  final String username;

  /// The password used for authentication with the ImgFlip API.
  final String password;

  /// Creates a new instance of the [ImgFlip] class.
  ImgFlip({required this.username, required this.password});

  /// Retrieves a list of available memes from the ImgFlip API.
  ///
  /// Returns a list of [Meme] objects representing the available memes.
  static Future<List<Meme>> getMemes() async {
    Map jsonResponse =
        await http.get(Uri.parse('https://api.imgflip.com/get_memes')).then(
              (value) => jsonDecode(value.body),
            );

    return List<Meme>.from(
      jsonResponse["data"]['memes'].map(
        (meme) => Meme.fromJson(meme),
      ),
    );
  }

  /// Generates a meme using the specified template ID and texts.
  ///
  /// The [templateId] parameter specifies the ID of the meme template to use.
  /// The [texts] parameter is a list of texts to be added to the meme.
  /// The [noWatermark] parameter indicates whether to include a watermark on the generated meme.
  /// The [font] parameter specifies the font to be used for the texts (optional).
  ///
  /// Returns the URL of the generated meme.
  Future<String> generateMeme(
      {required String templateId,
      required List<String> texts,
      bool noWatermark = false,
      String? font}) async {
    Map<String, String> body = {
      'template_id': templateId,
      'username': username,
      'password': password,
      'no_watermark': noWatermark ? '1' : '0',
    };

    if (font != null) {
      body['font'] = font;
    }

    for (int i = 0; i < texts.length; i++) {
      body['boxes[$i][text]'] = texts[i];
    }

    Map jsonResponse = await http
        .post(
          Uri.parse('https://api.imgflip.com/caption_image'),
          body: body,
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
          encoding: Encoding.getByName('utf-8'),
        )
        .then(
          (value) => jsonDecode(value.body),
        );

    if (jsonResponse['success'] == false) {
      throw Exception(jsonResponse['error_message']);
    }

    return jsonResponse['data']['url'];
  }
}
