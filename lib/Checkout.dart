import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni_pal/FrontControl/AppColor.dart';
import 'package:csc_picker/csc_picker.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  List<CartItem> cartItems = [
    CartItem(name: 'Item 1', price: 10),
    CartItem(name: 'Item 2', price: 20),
    CartItem(name: 'Item 3', price: 30),
    CartItem(name: 'Item 4', price: 40),
    CartItem(name: 'Item 5', price: 50),
  ];

  double totalAmount = 0;

  bool _isCreditCardPaymentSelected = false;

  // Address value
  String address1 = '';
  String address2 = '';
  String city = '';
  String state = '';
  String country = '';
  var zipcode = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.midlleParple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Checkout",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 18,
            color: Color(0xff000000),
          ),
        ),
        // If push the icon, it will go back to the previous page
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff000000),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.zero,
                  border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                ),
                //Add card
                child: Column(
                  children: [
                    // Add your panels here
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('Items in Cart'),
                          ),
                          Divider(),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: cartItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(cartItems[index].name),
                                trailing: Text('\$${cartItems[index].price}'),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('Total Amount'),
                            trailing:
                                Text('\$${totalAmount.toStringAsFixed(2)}'),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('Shipping Address'),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
                            child: TextField(
                              controller: TextEditingController(),
                              obscureText: false,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xffadadad),
                              ),
                              decoration: InputDecoration(
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff3a57e8), width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff3a57e8), width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff3a57e8), width: 1),
                                ),
                                hintText: "Address 1",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                ),
                                filled: true,
                                fillColor: Color(0xffffffff),
                                isDense: false,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                prefixIcon: Icon(Icons.roofing,
                                    color: Color(0xffadadad), size: 24),
                              ),
                              onChanged: (value) {
                                address1 = value;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: TextField(
                              controller: TextEditingController(),
                              obscureText: false,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xffadadad),
                              ),
                              decoration: InputDecoration(
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff3a57e8), width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff3a57e8), width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff3a57e8), width: 1),
                                ),
                                hintText: "Address 2",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                ),
                                filled: true,
                                fillColor: Color(0xffffffff),
                                isDense: false,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                prefixIcon: Icon(Icons.roofing,
                                    color: Color(0xffadadad), size: 24),
                              ),
                              onChanged: (value) {
                                address2 = value;
                              },
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                              child:
                                  //Source: https://pub.dev/packages/csc_picker
                                  CSCPicker(
                                onCountryChanged: (value) {
                                  country = value;
                                },
                                onStateChanged: (value) {
                                  state = value ?? "";
                                },
                                onCityChanged: (value) {
                                  city = value ?? "";
                                },
                              )),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 10, 50),
                            child: TextField(
                              controller: TextEditingController(),
                              obscureText: false,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xffadadad),
                              ),
                              decoration: InputDecoration(
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff3a57e8), width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff3a57e8), width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff3a57e8), width: 1),
                                ),
                                hintText: "Zip code",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                ),
                                filled: true,
                                fillColor: Color(0xffffffff),
                                isDense: false,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                prefixIcon: Icon(Icons.local_post_office,
                                    color: Color(0xffadadad), size: 24),
                              ),
                              onChanged: (value) {
                                // convert string to int and pass to zipcode
                                zipcode = int.parse(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('Payment Method'),
                          ),
                          Divider(),
                          RadioListTile(
                            title: Text('Cash on Delivery'),
                            value: false,
                            groupValue: _isCreditCardPaymentSelected,
                            onChanged: (value) {
                              setState(() {
                                _isCreditCardPaymentSelected = value!;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Credit Card'),
                            value: true,
                            groupValue: _isCreditCardPaymentSelected,
                            onChanged: (value) {
                              setState(() {
                                _isCreditCardPaymentSelected = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    if (_isCreditCardPaymentSelected) // Display credit card form if credit card payment is selected
                      Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('Credit Card Details'),
                            ),
                            Divider(),
                            // Credit card info input form
                            Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text('Credit Card Information'),
                                  ),
                                  Divider(),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Card Number',
                                      hintText: 'Enter your card number',
                                    ),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Name on Card',
                                      hintText: 'Enter the name on your card',
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Expiration Date',
                                            hintText: 'MM/YY',
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      Expanded(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'CVV',
                                            hintText: 'Enter the CVV number',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartItem {
  String name;
  double price;

  CartItem({required this.name, required this.price});
}
