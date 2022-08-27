import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:indonesia_guide/models/article.dart';

class FirebaseApiArticles {
  static String ARTICLES_COLLECTION = 'articles';   
   
  static Future createArticle({required Article article, required BuildContext context}) async {
    final docUser = FirebaseFirestore.instance.collection('articles').doc();

    article.id = docUser.id;
    // final article = Article(
    //   id: docUser.id,
    //   title: name,
    //   createdAt: DateTime.now()
    // );

    await docUser.set(article.toJson()).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Article created"),
      ));
    });
  }

  static Stream<QuerySnapshot<Map<String,dynamic>>> readArticles() {
    // FirebaseFirestore.instance
    //   .collection(PRGS_COLLECTION)
    //   .orderBy(ProgramField.createdTime, descending: true)
    //   .snapshots().map((event) => Program.fromJson).toList();  

    return FirebaseFirestore.instance
      .collection(ARTICLES_COLLECTION)
      .orderBy(ArticleField.createdAt, descending: true)
      .snapshots();
  }

}
