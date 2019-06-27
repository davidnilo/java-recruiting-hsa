class Coupon {
  String id;
  String description;
  String seller;
  String imageUrl;
  String expiresAt;

  Coupon(String id, String description, String seller, String imageUrl, String expiresAt) {
    this.id = id;
    this.description = description;
    this.seller = seller;
    this.imageUrl = imageUrl;
    this.expiresAt = expiresAt;
  }

  Coupon.fromJson(Map json)
      : id = json['id'],
        description = json['description'],
        seller = json['seller'],
        imageUrl = json['imageUrl'],
        expiresAt = json['expiresAt'];

  Map toJson() {
    return {'id': id, 'description': description, 'seller': seller, 'imageUrl': imageUrl, 'expiresAt': expiresAt};
  }
}

class ImageTypes {
  String small;
  String medium;
  String large;

  ImageTypes({this.small, this.medium, this.large});
  factory ImageTypes.fromJson(Map<String, dynamic> json) => _imageTypesFromJson(json);
}

ImageTypes _imageTypesFromJson(Map<String, dynamic> json) => ImageTypes(
  small: json['small'] as String,
  medium: json['medium'] as String,
  large: json['large'] as String,
);

class Category {
  String id;
  String name;
  String parentCategory;
  int relevance;
  String iconImage;
  ImageTypes images;

  Category({this.id, this.name, this.parentCategory, this.relevance, this.iconImage, this.images});
  factory Category.fromJson(Map<String, dynamic> json) => _categoryFromJson(json);
}

Category _categoryFromJson(Map<String, dynamic> json) {
  var imagesJson = json['images'];
  ImageTypes images = imagesJson != null ? new ImageTypes.fromJson(imagesJson) : null;
  return Category(
    id: json['id'] as String,
    name: json['name'] as String,
    parentCategory: json['parentCategory'] as String,
    relevance: json['relevance'] as int,
    images: images,
  );
}