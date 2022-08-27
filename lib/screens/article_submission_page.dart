import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:indonesia_guide/api/firebase_api_articles.dart';
import 'package:indonesia_guide/constants/common.dart';
import 'package:indonesia_guide/constants/r.dart';
import 'package:indonesia_guide/models/article.dart';
import 'package:indonesia_guide/constants/route_name.dart';
import 'package:indonesia_guide/widgets/custom_app_bar.dart';

class ArticleSubmissionpage extends StatefulWidget {
  static const String route = RouteName.routeArticleSubmissionPage;
  const ArticleSubmissionpage({Key? key}) : super(key: key);

  @override
  State<ArticleSubmissionpage> createState() => _ArticleSubmissionPageState();
}

class _ArticleSubmissionPageState extends State<ArticleSubmissionpage> {
  final titleController = TextEditingController();
  final cityController = TextEditingController();
  final provinceController = TextEditingController();
  final imageLinkController = TextEditingController();  
  final descController = TextEditingController();
  final ratingController = TextEditingController();
  final budgetController = TextEditingController();
  final categoryController = TextEditingController();
  String selectedRating = "Not Selected";
  String selectedCategory = "Not Selected";
  PlatformFile? pickedFile;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async{
    final path = 'files/my-image.jpg';
    final file = File(pickedFile!.path!);

  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> getDropdownItems(List<String> list) {
      List<DropdownMenuItem<String>> menuItems = [
        DropdownMenuItem(child: Text("Not Selected"), value: "Not Selected"),
      ];
      for (int i = 0; i < list.length; i++) {
        menuItems.add(DropdownMenuItem(child: Text(list[i]), value: list[i]));
      }
      return menuItems;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Article Submission Form'),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          primary: true,
          children: [
            Text('Title'),
            TextField(
              controller: titleController,
            ),
            Text('City'),
            TextField(
              controller: cityController,
            ),
            Text('Province'),
            TextField(
              controller: provinceController,
            ),
            Text('Upload Image Link'),
            TextField(
              controller: imageLinkController,
            ),
            // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            //   Text('Upload Image'),
            //   OutlinedButton(
            //     style: OutlinedButton.styleFrom(
            //       backgroundColor: R.colors.primary, //<-- SEE HERE
            //       primary: Colors.white,
            //     ),
            //     onPressed: () {
            //       selectFile();
            //     },
            //     child: const Text(
            //       'Upload Image',
            //     ),
            //   ),
            // ]),
            // if (pickedFile != null)
            //   Expanded(
            //     child: Container(
            //       color: Colors.blue[100],
            //       child: Image.file(
            //         File(pickedFile!.path!),
            //         width: double.infinity,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            Text('Article'),
            TextField(
              controller: descController,
              keyboardType: TextInputType.multiline,
              maxLines: null, // <-- SEE HERE
            ),
            Text('Rating'),
            DropdownButton(
                value: selectedRating,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRating = newValue!;
                  });
                },
                items: getDropdownItems(ratings)),
            Text('Budget'),
            TextField(
              controller: budgetController,
            ),
            Text('Category'),
            DropdownButton(
                value: selectedCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue!;
                  });
                },
                items: getDropdownItems(categories)),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: R.colors.primary, //<-- SEE HERE
                primary: Colors.white,
              ),
              onPressed: () {
                final article = Article(
                  title: titleController.text,
                  province: provinceController.text,
                  city: cityController.text,
                  imageLinks: [imageLinkController.text],
                  description: descController.text,
                  rating: selectedRating == "" ? 0 : int.parse(selectedRating),
                  budget: budgetController.text,
                  category: [selectedCategory],
                  createdAt: DateTime.now()
                ); 

                FirebaseApiArticles.createArticle(article: article, context: context);
                clearControllers();
              },
              child: const Text(
                'Add Article',
              ),
            ),
          ],
        ),
      ),
    );
  }

  clearControllers() {
    titleController.clear();
    cityController.clear();
    provinceController.clear();
    imageLinkController.clear();
    descController.clear();
    ratingController.clear();
    budgetController.clear();
    categoryController.clear();
    selectedRating = "Not Selected";
    selectedCategory = "Not Selected";
  }
}
