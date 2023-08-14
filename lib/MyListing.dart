import 'package:flutter/material.dart';
import 'package:uni_pal/FrontControl/AppColor.dart';

class MyListing extends StatefulWidget {
  MyListing({Key? key}) : super(key: key);

  @override
  _MyListingState createState() => _MyListingState();
}

class _MyListingState extends State<MyListing>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.lightParple,
        appBar: AppBar(
          elevation: 4,
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.midlleParple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          title: Text(
            "Listing",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 18,
              color: Color(0xff000000),
            ),
          ),
          leading: Icon(
            Icons.arrow_back,
            color: Color(0xff212435),
            size: 24,
          ),
        ),
        body: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(8),
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: <Widget>[
            ListingView(
              title:"Textbook listing",
              //Todo: Change the list when connect with database
              itemName: [
                "Complete Mathematics for Cambridge IGCSE",
                "Pemberton Mathematics for Cambridge IGCSE...",
                "Complete Mathematics for Cambridge IGCSE",
                "Pemberton Mathematics for Cambridge IGCSE...",
                "Complete Mathematics for Cambridge IGCSE",
              ],
              itemImage: [
                "assets/images/textbookLA.png",
                "assets/images/textbookLA.png",
                "assets/images/textbookLA.png",
                "assets/images/textbookLA.png",
                "assets/images/textbookLA.png",
              ],
              price: [
                34,
                34,
                34,
                34,
                34,
              ],
              author: [
                "Sue emberton",
                "Sue emberton",
                "Sue emberton",
                "Sue emberton",
                "Sue emberton",
              ],
            )
          ]
        )
    );
  }
}

class ListingView extends StatelessWidget{
  final String title;
  final List<String> itemName;
  final List<String> itemImage;
  final List<int> price;
  final List<String> author;

  const ListingView({Key? key,
    required this.title,
    required this.itemName,
    required this.itemImage,
    required this.price,
    required this.author
  })
      : super(key: key);

  @override
  Widget build(BuildContext context){
    return CustomPaint(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: AppColor.midlleParple,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.zero,
              border: Border.all(color: Color(0x4d9e9e9e), width: 1),
            ),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: itemName.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){

                    },
                    child: Card (

                        color: AppColor.lightParple,
                        child: ListTile(
                          title: Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image(
                                  image: AssetImage(
                                      itemImage[index]
                                  ),
                                  height: 130,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          itemName[index],
                                          textAlign: TextAlign.start,
                                          maxLines: 3,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 13,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                          child: Text(
                                            author[index],
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12,
                                              color: Color(0xff7a7a7a),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                          child: Text(
                                            "\$${price[index]}",
                                            textAlign: TextAlign.start,
                                            maxLines: 2,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
