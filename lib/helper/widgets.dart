import 'package:flutter/material.dart';
import 'package:news_app/views/article_view.dart';

class NewsTile extends StatefulWidget {
  final String imgUrl, title, desc, content, posturl;
   bool nightMode;

  NewsTile({required this.imgUrl, required this.desc, required this.title, required this.content, required this.posturl,required this.nightMode});

  @override
  _NewsTileState createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
              postUrl: widget.posturl,
            )
        ));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        widget.imgUrl,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: 12,),
                  Text(
                    widget.title,
                    maxLines: 2,
                    style: TextStyle(
                        color: widget.nightMode?Colors.white:Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.desc,
                    maxLines: 2,
                    style: TextStyle(color: widget.nightMode?Colors.white:Colors.black54, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
