import 'package:flutter/material.dart';
import 'package:assignment1/firstpage.dart';
class SecondPage extends StatefulWidget{
  String book,author,about,photo,price;
  double rating;
  int ratingcount;
  SecondPage({required this.book,required this. author,required this.rating,required this.ratingcount,required this.about,required this.photo,required this.price});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  //SecondPage des;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2nd page'),
      ),
      body: ListView(
        children: [Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
           // mainAxisSize: MainAxisSize.min,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              Container(
                child: Text(
                  widget.book,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),

              SizedBox(height: 12.0),
              Container(
                child: Text(
              widget.author,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black54,
              ),
               textAlign: TextAlign.start,
               ),
               ),
              SizedBox(height: 2.0),
              Container(
                  child: RatingBar(rating: widget.rating,ratingCount: widget.ratingcount),
                alignment: Alignment.centerLeft,


              ),
              SizedBox(height: 10.0),
              Container(
                 child: Image(image: AssetImage(widget.photo),
                   alignment: Alignment.center,

                   //color: Colors.grey[200],
                 ),
               ),
              //),
              SizedBox(height: 10.0),
              Text(

                widget.about,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10.0),
              Container(
                child: Text(
                 "Price: \$${widget.price}" ,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                child: DropdownMenuExample(),
              ),
              SizedBox(height: 18.0),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton.icon(

                  onPressed: (){
                    Navigator.pop(context);
                  },
                  label: const Text('Go Back! '),
                  icon: Icon(Icons.arrow_back_ios_outlined),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),

                ),
              ),

            ],

          ),


        ),
    ],
      ),
    );
  }
}

//DROPDOWN


const List<String> list = <String>["Hardcover", "Paperback","Kindle","Audiobook"];

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}

