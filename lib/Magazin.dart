import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data/magazin_services.dart';
import 'models/MagazinArticles.dart';



class Magazin extends StatefulWidget {
  const Magazin({Key? key}) : super(key: key);

  @override
  State<Magazin> createState() => _MagazinState();
}

class _MagazinState extends State<Magazin> {

  int eklesayi = 0;
  List<Articles> articles = [];


  @override
  void initState() {
    NewsService.getNews().then((value) {
      setState(() {
        articles = value!;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Center(child: Text('MAGAZİN')),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index){
              return Card(
                  child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 350),
                          child: LikeButton(
                            size: 30,
                            likeCount: eklesayi,
                            countPostion: CountPostion.bottom,
                            likeBuilder: (isTapped) {
                              return Icon(
                                Icons.bookmark,
                                color: isTapped ? Colors.deepPurpleAccent: Colors.grey,
                                size: 30,
                              );
                            },
                          ),
                        ),
                        Image.network(articles[index].urlToImage.toString()),
                        ListTile(
                          leading: Icon(Icons.arrow_circle_down),
                          title: Text(articles[index].title.toString()),
                          subtitle: Text(articles[index].author.toString()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text((articles[index].description.toString())),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            MaterialButton(
                                onPressed: () async {
                                  await launch(articles[index].url.toString());
                                },
                                child: Text('Habere Git')),
                          ],
                        ),
                      ])
              );
            }
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
