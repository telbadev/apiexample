class ProductModel {
  String? createdAt;
  String? price;
  String? description;
  String? name;
  String? owner;
  String? image;
  String? id;

  ProductModel(
      {this.createdAt,
        this.price,
        this.description,
        this.name,
        this.owner,
        this.image,
        this.id});

  ProductModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    price = json['price'];
    description = json['description'];
    name = json['name'];
    owner = json['owner'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['price'] = this.price;
    data['description'] = this.description;
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}