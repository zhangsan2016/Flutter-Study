import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nonghang/model/InvestModel.dart';

class InvestInformation extends StatefulWidget {
  final InvestModel model;
  InvestInformation({Key key, this.model}) : super(key: key);

  @override
  _InvestInformationState createState() => _InvestInformationState();
}

class _InvestInformationState extends State<InvestInformation> {

  InvestModel model;

  @override
  void initState() {
    super.initState();
    model = widget.model;
  }
  @override
  Widget build(BuildContext context) {

    List<Widget> items = model.information.map((item){
      return Column(
        children: <Widget>[
          Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                          child: Text(
                            item["title"],
                            style: TextStyle(
                              fontSize: 17,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Text(
                            "${item["user"]} | ${item["date"]}",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black38),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ]),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                          padding: EdgeInsets.only(right:20),
                          child: CachedNetworkImage(
                        imageUrl:
                            item["url"],
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    )),
              ],
            ),
            SizedBox(height: 20),
        ],
      );
    }).toList();

    return Container(
          color: Colors.white,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                  child: Text(
                    "资讯",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )),
              Icon(Icons.chevron_right),
            ]),
            Column(children: items)
          ]));
  }
}