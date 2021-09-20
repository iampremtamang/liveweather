import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liveweather/bloc/weather_bloc.dart';
import 'package:liveweather/bloc/weather_event.dart';
import 'package:liveweather/bloc/weather_state.dart';
import 'package:liveweather/model/weather_detail.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


  @override
  Widget build(BuildContext context) {
    var cityController = TextEditingController();
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

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
  
        BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context,state) {
            
            if(state is WeatherIsNotLoaded || state is WeatherIsNotSearched) {
              return Container(
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
                          print(cityController.text);
                          weatherBloc.add(FetchWeather(cityController.text));

                        },
                        color: Colors.lightBlue,
                        child:Text('Search', style: TextStyle(color:Colors.white70,fontSize: 16),),
                      ),
                    )
                  ],
                ),
              );
        
            } else if(state is WeatherIsLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherIsLoaded) {
                return WeatherDetail(state.getWeather, cityController.text);
            }               else {
              return Text('error', style:TextStyle(color: Colors.white, fontSize: 20));
              }
            }
           
        ),
      ],
    );
  }
}