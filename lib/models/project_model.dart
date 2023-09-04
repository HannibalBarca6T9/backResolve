class ProjectModel {
  final String id;
  final String name;
  final String image;
  final String address;
  final String nomberlogement;
  final List entreprise = [];
  final String pdf;

  ProjectModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.address,
      required this.nomberlogement,
      required this.pdf});
  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['_id'],
      name: json['nom'],
      image: json['photo'],
      address: json[''],
      nomberlogement: json[''],
      pdf: json[''],

      //projects: json['project']
    );
  }
}
