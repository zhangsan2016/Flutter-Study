import 'package:flutter/material.dart';
import 'package:nonghang/model/HomeModel.dart';

class HomeRecommendedActivity extends StatefulWidget {
  final HomeModel model;
  HomeRecommendedActivity({Key key,this.model}) : super(key: key);

  @override
  _HomeRecommendedActivityState createState() => _HomeRecommendedActivityState();
}

class _HomeRecommendedActivityState extends State<HomeRecommendedActivity> {
  HomeModel model;
  @override
  void initState() {
    super.initState();
    model = widget.model;
  }
  @override
  Widget build(BuildContext context) {

    Widget recommendItem(item) {
      return Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["rate"],
                        style: TextStyle(fontSize: 30, color: Colors.redAccent),
                      ),
                      Text(item["type"],
                          style:
                              TextStyle(fontSize: 15, color: Colors.black38)),
                    ])),
          ),
          Expanded(
              flex: 2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["title"],
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(item["tip"],
                        style: TextStyle(fontSize: 15, color: Colors.black38)),
                  ])),
          Icon(Icons.chevron_right)
        ],
      );
    }

            List<Widget> items = List();
        for(int i = 0; i<model.reActivity.length;i++){
            
            items.add(Column(
              children: <Widget>[
                recommendItem(model.reActivity[i]),
                i != model.reActivity.length-1 ? Divider(color: Colors.black38, indent: 20):Container()
              ],
            ));
        }

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
              child: Text(
                "为你推荐",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              )),
          Column(
            children: items
          ),
          SizedBox(height: 20),
        ],
      );
  }
}