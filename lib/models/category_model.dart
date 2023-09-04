class CategoryModel {
  final String id;
  final String name;
  final String image;
  final List projects=[];

  CategoryModel( {required this.id, required this.name, required this.image});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      name: json['nom'],
      image: json['photo'],
      //projects: json['project']
    );
  }
}
