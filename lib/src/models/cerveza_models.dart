class CervezaModels {
  String name;
  String tagline;
  String description;
  String imageUrl;

  CervezaModels({
    required this.name,
    required this.tagline,
    required this.description,
    required this.imageUrl,
  });

  factory CervezaModels.transformarInstancia(Map<String, dynamic> cerveza) {
    return CervezaModels(
      name: cerveza['name'],
      tagline: cerveza['tagline'],
      description: cerveza['description'],
      imageUrl: cerveza['image_url'],
    );
  }

  get sprites => null;
}
