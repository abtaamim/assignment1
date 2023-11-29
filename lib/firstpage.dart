import 'package:flutter/material.dart';
import 'package:assignment1/Description.dart';
import 'package:assignment1/secondPage.dart';
class FirstPage extends StatefulWidget{
  //const FirstPage ({super.key});
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Description>ds=[
    Description(book: 'Gone Girl', author: 'by Gillian Flynn', rating: 4.5, ratingcount: 345670,
        about: "Who are you?\nWhat have we done to each other?\n\nThese are the questions Nick Dunne finds himself asking on the morning of his fifth wedding anniversary when his wife Amy suddenly disappears.The police suspect Nick. Amys friends reveal that she was afraid of him, that she kept secrets from him. The police suspect Nick. Amys friends reveal that she was afraid of him"
         "that she kept secrets from him. He swears it isnt true. A police examination of his computer shows strange searches. He says they weren't made by him. And then there are the persistent calls on his mobile phone."
         "\nSo what did happen to Nicks beautiful wife?",
        photo: 'assets/gonegirl.jpg',price: 17.5),
    Description(book: 'Mystic River', author: 'by Dennis Lehane', rating: 4.5, ratingcount: 112540,
        about: "When they were children, Sean Devine, Jimmy Marcus, and Dave Boyle were friends. But then a strange car pulled up to their street."
        "One boy got into the car, two did not, and something terrible happened -- something that ended their friendship and changed all three boys forever.\n\n"
        "Twenty-five years later, Sean is a homicide detective. Jimmy is an ex-con who owns a corner store. And Dave is trying to hold his marriage together and keep his demons at bay -- demons that urge him to do terrible things. When Jimmy's daughter is found murdered, Sean is assigned to the case. His investigation brings him into conflict with Jimmy, who finds his old criminal impulses tempt him to solve the crime with brutal justice. And then there is Dave, who came home the night Jimmy's daughter died covered in someone else's blood.",
        photo: 'assets/mystic.jpg',price: 22.5),
    Description(book: 'The girl with the Dragon Tattue ', author: 'by Stieg Larsson', rating: 4.5, ratingcount: 42560,
        about: "Harriet Vanger, a scion of one of Sweden’s wealthiest families disappeared over forty years ago. All these years later, her aged uncle continues to seek the truth. "
        "He hires Mikael Blomkvist, a crusading journalist recently trapped by a libel conviction, to investigate."
        " He is aided by the pierced and tattooed punk prodigy Lisbeth Salander. Together they tap into a vein of unfathomable iniquity and astonishing corruption.\n\n"
        "An international publishing sensation, Stieg Larsson’s The Girl with the Dragon Tattoo combines murder mystery,"
        " family saga, love story, and financial intrigue into one satisfyingly complex and entertainingly atmospheric novel.",
        photo: 'assets/dragon.jpg',price: 15.5),
    Description(book: "The Bone Collector", author: "by Jeffery Deaver", rating: 4.2, ratingcount: 177810,
        about: "Lincoln Rhyme was once a brilliant criminologist, a genius in the field of forensics -- until an accident left him physically and emotionally shattered."
        " But now a diabolical killer is challenging Rhyme to a terrifying and ingenious duel of wits. With police detective Amelia Sachs by his side, "
        "Rhyme must follow a labyrinth of clues that reaches back to a dark chapter in New York City's past -- and reach further into the"
        "darkness of the mind of a madman who won't stop until he has stripped life down to the bone.",
        photo: 'assets/bone.jpg', price: 13.85),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.end,
          'Bookworm',
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        backgroundColor: Colors.grey[200],
      ),
      body: SingleChildScrollView(
        child: Column(

        children: ds.map((dis) => Profile(des: dis,
            buy: (){
            }
        )).toList(),

      ),
      ),
    );


  }
}
class Profile extends StatelessWidget{
  final Description des;
  final VoidCallback buy;
  Profile({required this.des, required this. buy});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      color: Colors.grey[200],
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //children: [
            children:<Widget> [
               Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,

            child: Container(
                        child: Image(image: AssetImage(des.photo),
                      alignment: Alignment.center,
                        //color: Colors.grey[200],

                ),
                    ),
                  ),
                  SizedBox(width: 18.0),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 110.0,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              des.book,
                              style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                         // SizedBox(height: 4.0),
                    SizedBox(height: 2.0),
                          Text(

                      des.author,
                      style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black54,

                    ),
                      textAlign: TextAlign.start,
                  ),

                    Row(children:<Widget>[
                      RatingBar(rating: des.rating,ratingCount: des.ratingcount),
                      SizedBox(width: 8.0),
                      Text(des.ratingcount.toString()),
                    ]

                    ),

                          SizedBox(height: 8.0),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 8.0),
             TextButton.icon(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  ),
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context)=>SecondPage(
                          about: des.about,
                          ratingcount: des.ratingcount,rating: des.rating,
                          author: des.author, book: des.book,
                          price:  des.price, photo: des.photo,
                        ),
                    ),
                    );
                  },
                  icon: Icon(Icons.shopping_bag_rounded),
                  label: Text('Buy Now'),

              ),
            ]
        ),

      ),
    );
  }

}


//RATING BAR *****//

class RatingBar extends StatelessWidget{
  final double rating;
  final double size;
  int? ratingCount;
  RatingBar({required this.rating, this. ratingCount, this.size=18});

  @override
  Widget build(BuildContext context) {
    List<Widget> _starList = [];
    int realN=rating.floor();
    int partN=((rating-realN)*10).ceil();
    
    for(int i=0;i<5;i++){
      if(i<realN){
        _starList.add(Icon(Icons.star,color: Colors.amber[800],size: size));
      }
      else if(i== realN){
        _starList.add(SizedBox(
          height: size,
          width: size,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Icon(Icons.star,color: Colors.amber[800], size: size),
              ClipRect(
                clipper: _Clipper(part: partN),
                child: Icon(Icons.star,color: Colors.grey, size: size),
              )
            ],
          ),
        ));

      }else{
        _starList.add(Icon(Icons.star,color: Colors.grey, size: size));
      }
      Text('$ratingCount');
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _starList,
    );
  }
}

class _Clipper extends CustomClipper<Rect>{
  final int part;
  _Clipper({required this.part});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB((size.width/10)*part, 0.0, size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) =>true;
  
}

