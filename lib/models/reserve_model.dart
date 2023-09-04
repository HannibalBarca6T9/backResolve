import 'dart:core';

class ReserveModel {
  final String id;
  final String numero;
  final String entreprise;
  final String libele;
  final String support;
  final String nature;
  final String type;
  final String zone;
  final DateTime perioriter;
  final DateTime datedepot;
  final DateTime datelivraison;
  final String commentaire;
  final String photo;

  ReserveModel(
      {
        required this.id,
      required this.numero,
      required this.entreprise,
      required this.libele,
      required this.support,
      required this.nature,
      required this.type,
      required this.zone,
      required this.perioriter,
      required this.datedepot,
      required this.datelivraison,
      required this.commentaire,
      required this.photo});
  factory ReserveModel.fromJson(Map<String, dynamic> json) {
    return ReserveModel(
      id: json['_id'],
      numero: json['numero'],
      entreprise: json['Entreprise'],
      libele: json['libele'],
      support: json['Support'],
      nature: json['Nature'],
      type: json['type'],
      zone: json['Zone'],
      perioriter: json['Perioriter'],
      datedepot: json['Datedepot'],
      datelivraison: json['datelivraison'],
      commentaire: json['Commentaire'],
      photo: json['photo'],      //projects: json['project']
    );
  }
}

