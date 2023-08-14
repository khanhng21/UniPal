import 'package:flutter/material.dart';
import 'package:uni_pal/FrontControl/BottomNavigation.dart';
import 'package:uni_pal/FrontControl/AppColor.dart';

class Home extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.midlleParple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Home",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: AppColor.fontColor,
          ),
        ),
        leading: Icon(
          Icons.arrow_back,
          color: AppColor.iconColor,
          size: 24,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
            child:
                Icon(Icons.notifications, color: AppColor.iconColor, size: 24),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
            child:
                Icon(Icons.shopping_cart, color: AppColor.iconColor, size: 24),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Icon(Icons.send, color: AppColor.iconColor, size: 24),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            searchBar(),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CategoriesListView(
                      title: "Categories",
                      categories: [
                        "assets/images/textbookLA.png",
                        "assets/images/textbookLA.png",
                        "assets/images/textbookLA.png",
                        "assets/images/textbookLA.png",
                        "assets/images/textbookLA.png",
                      ],
                      categoryTitle: [
                        "Art",
                        "Business",
                        "Computer Science",
                        "Design",
                        "Education",
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
              color: AppColor.lightParple,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "View History",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // TODO: View All transition
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(fontSize: 18.0, color: Colors.blue),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ViewHistoryView(
              //Todo: Edit below code when connect with database
              title: "View History",
              itemImage: [
                "assets/images/textbookLA.png",
                "assets/images/textbookLA.png",
                "assets/images/textbookLA.png",
                "assets/images/textbookLA.png",
                "assets/images/textbookLA.png",
              ],
              itemName: [
                "Art",
                "Business",
                "Computer Science",
                "Design",
                "Education",
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
              color: AppColor.midlleParple,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Related Items",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // TODO: View All transition
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(fontSize: 18.0, color: Colors.blue),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RelatedView(
              title: "Related Items",
              itemImage: [
                "assets/images/textbookLA.png",
                "assets/images/textbookLA.png",
                "assets/images/textbookLA.png",
                "assets/images/textbookLA.png",
                "assets/images/textbookLA.png",
              ],
              itemName: [
                "Art",
                "Business",
                "Computer Science",
                "Design",
                "Education",
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  searchBar() {
    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: AppColor.lightParple,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.zero,
        border: Border.all(color: Color(0x4d9e9e9e), width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
        child: TextField(
          controller: TextEditingController(),
          obscureText: false,
          textAlign: TextAlign.start,
          maxLines: 1,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color(0xff000000),
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Color(0xff000000), width: 1),
            ),
            labelText: "Search Textbook...",
            labelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            fillColor: Color(0xfff2f2f3),
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            prefixIcon: Icon(Icons.search, color: Color(0xff212435), size: 24),
          ),
        ),
      ),
    );
  }
}

class CategoriesListView extends StatelessWidget {
  final String title;
  final List<String> categories;
  final List<String> categoryTitle;

  const CategoriesListView(
      {Key? key,
      required this.title,
      required this.categories,
      required this.categoryTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              color: AppColor.midlleParple,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.zero,
              border: Border.all(color: Color(0x4d9e9e9e), width: 1),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    //Todo: Navigate to each category page
                  },
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              width: 55,
                              height: 55,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.blueGrey,
                                  width: 1,
                                ),
                              ),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      categories[index],
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                categoryTitle[index],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Regular',
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ])),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ViewHistoryView extends StatelessWidget {
  final String title;
  final List<String> itemName;
  final List<String> itemImage;

  const ViewHistoryView(
      {Key? key,
      required this.title,
      required this.itemName,
      required this.itemImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.20,
            decoration: BoxDecoration(
              color: AppColor.lightParple,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.zero,
              border: Border.all(color: AppColor.boaderColor, width: 1),
            ),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemName.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      //Todo: Navigate to each category page
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ///***If you have exported images you must have to copy those images in assets/images directory.
                        Image(
                          image: AssetImage(
                            //Todo: Change the image location when connect with database
                            itemImage[index],
                          ),
                          height: 100,
                          width: 140,
                          fit: BoxFit.fitHeight,
                        ),
                        //　Make space between image and text
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          itemName[index],
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: AppColor.fontColor,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class RelatedView extends StatelessWidget {
  final String title;
  final List<String> itemName;
  final List<String> itemImage;

  const RelatedView(
      {Key? key,
      required this.title,
      required this.itemName,
      required this.itemImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.20,
            decoration: BoxDecoration(
              color: AppColor.midlleParple,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.zero,
              border: Border.all(color: Color(0x4d9e9e9e), width: 1),
            ),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemName.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      //Todo: Navigate to each category page
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ///***If you have exported images you must have to copy those images in assets/images directory.
                        Image(
                          image: AssetImage(
                            //Todo: Change the image location when connect with database
                            itemImage[index],
                          ),
                          height: 100,
                          width: 140,
                          fit: BoxFit.fitHeight,
                        ),
                        Text(
                          itemName[index],
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
