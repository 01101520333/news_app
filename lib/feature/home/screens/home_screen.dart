import 'package:flutter/material.dart';
import 'package:news_app/feature/home/data/api/news_api.dart';
import 'package:news_app/feature/home/data/models/news_model.dart';
import 'package:news_app/feature/home/widgets/image_item_widget.dart';
import 'package:news_app/network/resulet_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Articles> articles = [];
  bool isLoading = true;
  String errorMasseg = "";
  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        backgroundColor: Color(0xff1877F2),
        title: Text('News App', style: Theme.of(context).textTheme.bodyLarge),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMasseg.isEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
                return ImageItemWidget(
                  image: articles[index].urlToImage ?? dummyImage,
                  title: articles[index].title ?? "",
                  onTap: () {},
                );
              },
              itemCount: articles.length,
            )
          : Center(
              child: Text(
                errorMasseg,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w400,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
    );
  }

  Future<void> getNews() async {
    isLoading = true;
    setState(() {});
    final resulet = await NewsApi.getNews();
    switch (resulet) {
      case Success<NewsModel>():
        articles = resulet.data.articles ?? [];
        isLoading = false;
      case Error<NewsModel>():
        errorMasseg = resulet.error;
        isLoading = false;
    }
    setState(() {});
  }
}

String dummyImage =
    'https://images.theconversation.com/files/651621/original/file-20250226-32-jxjhmy.jpg?ixlib=rb-4.1.0&rect=0%2C0%2C5991%2C3997&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip';
