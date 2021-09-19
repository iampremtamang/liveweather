import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            child: Image.asset('assets/images/weather.png', fit: BoxFit.contain,),
            height: 300,
            width: 300,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left:32, right:32),
          child: Column(
            children: <Widget>[
              Text(
                'Live Weather',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color:Colors.white70,
                  ),
                ),
              Text(
                "Search weather by location",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w200,
                  color:Colors.white70,

                ),

              ),
              SizedBox(height: 24,),
              TextFormField(
                controller: cityController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color:Colors.white70),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color:Colors.white70,
                      style: BorderStyle.solid,
                    )
                    
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color:Colors.blue,
                        style:BorderStyle.solid

                      ),
                    ),
                    hintText: "City Name",
                    hintStyle: TextStyle(color:Colors.white70),
                  
              
                ),
                style:TextStyle(color:Colors.white70),
              ),
              SizedBox(height:20,),
              Container(
                width: double.infinity,
                height: 50,
                child: FlatButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  onPressed: () {

                  },
                  color: Colors.lightBlue,
                  child:Text('Search', style: TextStyle(color:Colors.white70,fontSize: 16),),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}