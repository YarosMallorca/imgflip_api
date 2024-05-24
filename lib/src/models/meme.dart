/// Represents a meme.
class Meme {
  final String id;
  final String name;
  final Uri url;
  final int width;
  final int height;
  final int boxCount;

  /// Creates a new instance of the [Meme] class.
  ///
  /// The [id] is the unique identifier of the meme.
  /// The [name] is the name of the meme.
  /// The [url] is the URL of the meme image.
  /// The [width] is the width of the meme image.
  /// The [height] is the height of the meme image.
  /// The [boxCount] is the number of text boxes in the meme.
  Meme({
    required this.id,
    required this.name,
    required this.url,
    required this.width,
    required this.height,
    required this.boxCount,
  });

  /// Creates a new instance of the [Meme] class from a JSON object.
  ///
  /// The [json] parameter is a JSON object containing the meme data.
  factory Meme.fromJson(Map<String, dynamic> json) {
    return Meme(
      id: json['id'],
      name: json['name'],
      url: Uri.parse(json['url']),
      width: json['width'],
      height: json['height'],
      boxCount: json['box_count'],
    );
  }

  @override
  String toString() {
    return 'Meme{id: $id, name: $name, url: $url, width: $width, height: $height, boxCount: $boxCount}';
  }
}
