class Config {
  final String apiUrl;

  Config({
    required this.apiUrl,
  });

  factory Config.fromMap(Map<String, dynamic> map) => Config(
    apiUrl: map['apiUrl'] as String,
      );
}
