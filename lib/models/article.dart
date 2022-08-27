import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  String? id;
  String? title;
  String? province;
  String? city;
  List<dynamic>? imageLinks;
  String? description;
  int? rating;
  String? budget;
  List<dynamic>? category;
  DateTime? createdAt;

  Article({
    this.id, 
    this.title, 
    this.province,
    this.city,
    this.imageLinks,
    this.description,
    this.rating,
    this.budget,
    this.category,
    this.createdAt
  });

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'province' :  province,
    'city' : city ,
    'imageLinks' : imageLinks,
    'description' : description,
    'rating' : rating,
    'budget' : budget,
    'category' : category,
    'createdAt' : createdAt
  };

  static fromJson(Map<String, dynamic> json) => Article(
    id: json['id'], 
    title: json['title'], 
    createdAt: ( json['createdAt'] as Timestamp ).toDate(),
  );



}

class ArticleField {
  static const createdAt = 'createdAt';
  static const category = 'category';
}