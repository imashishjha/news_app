import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/widgets.dart';
import 'package:news_app/models/catergory_modal.dart';
import 'package:news_app/views/category_news.dart';

import '../helper/news.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _loading;
  var newslist;
  late bool nightMode = false;

  List<CategorieModel> categories = <CategorieModel>[];

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();

    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nightMode?Colors.black:Colors.white,
      appBar: AppBar(
        backgroundColor: nightMode?Colors.black:Colors.white,
        leading: IconButton(
          onPressed: (){
            setState(() {
              nightMode=false;
            });
          },
          icon: Icon(Icons.light_mode_outlined,color: nightMode?Colors.white:Colors.black,),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Daily",
              style:
                  TextStyle(color: nightMode?Colors.white:Colors.black, fontWeight: FontWeight.w700,fontSize: 22),
            ),
            SizedBox(width: 6,),
            Text(
              "N",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700,fontSize: 24),
            ),
            Text(
              "e",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700,fontSize: 24),
            ),
            Text(
              "w",
              style: TextStyle(color: nightMode?Colors.yellow:Colors.purple, fontWeight: FontWeight.w700,fontSize: 24),
            ),
            Text(
              "s",
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700,fontSize: 24),
            )
          ],
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: (){
                setState(() {
                  nightMode=true;
                });
              },
              icon: Icon(
                Icons.dark_mode_outlined,
                color: nightMode?Colors.white:Colors.black,
              ),
            ),
          ),
        ],
        elevation: 2,
      ),
      body: SafeArea(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('Choose from your favorite catogery:',style: TextStyle(color: nightMode?Colors.white:Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),),
                      ),
                      SizedBox(height: 5,),
                      /// Categories
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 70,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return CategoryCard(
                                imageAssetUrl: categories[index].imageAssetUrl,
                                categoryName: categories[index].categorieName,
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('Recent News:',style: TextStyle(color: nightMode?Colors.white:Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),),
                      ),
                      /// News Article
                      Container(
                        margin: EdgeInsets.only(top: 14),
                        child: ListView.builder(
                            itemCount: newslist.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NewsTile(
                                imgUrl: newslist[index].urlToImage ?? "",
                                title: newslist[index].title ?? "",
                                desc: newslist[index].description ?? "",
                                content: newslist[index].content ?? "",
                                posturl: newslist[index].articleUrl ?? "",
                                nightMode: nightMode,
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imageAssetUrl, categoryName;

  CategoryCard({required this.imageAssetUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(
                      newsCategory: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: imageAssetUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}

