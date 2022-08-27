import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:indonesia_guide/api/firebase_api_articles.dart';
import 'package:indonesia_guide/constants/r.dart';
import 'package:indonesia_guide/models/article.dart';
import 'package:indonesia_guide/constants/route_name.dart';
import 'package:indonesia_guide/widgets/custom_app_bar.dart';
import 'package:indonesia_guide/widgets/custom_dropdown.dart';
import 'package:indonesia_guide/widgets/custom_textfield.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Article Submission Form"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          addSemanticIndexes: true,
          shrinkWrap: true,
          primary: false,
          children: [
            const SizedBox(height: 20),
            CustomTextfield(
              title: "Title",
              hintText: "Your article title",
              controller: titleController,
            ),
            const SizedBox(height: 15),
            CustomTextfield(
              title: "City",
              hintText: "The city of destination ",
              controller: cityController,
            ),
            const SizedBox(height: 15),
            CustomTextfield(
              title: "Province",
              hintText: "The province of destination",
              controller: provinceController,
            ),
            const SizedBox(height: 15),
            CustomTextfield(
              title: "Upload Image Link",
              hintText: "Attach the url of your image",
              controller: imageLinkController,
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 15),
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
            CustomTextfield(
              title: "Article",
              hintText: "Content of your article",
              controller: descController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            const SizedBox(height: 15),
            CustomDropdown(
              title: "Rating",
              obj: [
                ...["Not Selected"],
                ...R.strings.rating,
              ],
              callback: (val) {
                selectedRating = val!;
                setState(() {});
              },
            ),
            const SizedBox(height: 15),
            CustomTextfield(
              title: "Budget",
              hintText: "Estimation budget",
              controller: budgetController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            CustomDropdown(
              title: "Category",
              obj: [
                ...["Not Selected"],
                ...R.strings.category,
              ],
              callback: (val) {
                selectedCategory = val!;
                setState(() {});
              },
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final article = Article(
              title: titleController.text,
              province: provinceController.text,
              city: cityController.text,
              imageLinks: [imageLinkController.text],
              description: descController.text,
              rating: selectedRating == "Not Selected"
                  ? 0
                  : int.parse(selectedRating),
              budget: "Rp ${budgetController.text}",
              category: [selectedCategory],
              createdAt: DateTime.now());

          FirebaseApiArticles.createArticle(article: article, context: context);
          clearControllers();
        },
        backgroundColor: R.colors.primary,
        child: const Icon(
          Icons.add,
          semanticLabel: "Submit Article",
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
