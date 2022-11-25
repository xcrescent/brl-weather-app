import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather_app/controller/http_controller.dart';
import 'package:weather_app/models/citiesmodel.dart';
import 'package:weather_app/screens/city_weather.dart';
//  Google Maps Platform
//  API KEY
//  AIzaSyD3SoLVF_HMOJOSc8drpWs_iXDJYX_WjYU

class FavouriteFragment extends StatefulWidget {
  const FavouriteFragment({super.key});

  @override
  State<FavouriteFragment> createState() => _FavouriteFragmentState();
}

class _FavouriteFragmentState extends State<FavouriteFragment> {
  final _searchController = TextEditingController();
  late Future<Cities> futureCity;
  String cities = '';
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_printLatestValue);

    futureCity = HttpController().getCityFunc(cities);

    // citiesData().fetchData();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // String googleApikey = "AIzaSyD3SoLVF_HMOJOSc8drpWs_iXDJYX_WjYU";
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              // cursorColor: buttonColor,
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(borderSide: BorderSide.none),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff82BAFB)),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                labelText: 'Search City',
                // labelStyle: TextStyle(color: buttonColor),
                prefixIcon: Icon(
                  Icons.search,
                  // color: buttonColor,
                ),
              ),
              controller: _searchController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
                future: futureCity,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    int x=0;
                    if(snapshot.data!.city.length>30) x= 30; else x= snapshot.data!.city.length;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: x,
                      controller: ScrollController(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CityWeather(
                                      city: snapshot.data!.city[index])),
                            );
                          },
                          child: ListTile(
                            title: Text(snapshot.data!.city[index]),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [CircularProgressIndicator()]);
                }),
          )
          // SingleChildScrollView(
          //   child: GridView.count(
          //     // Create a grid with 2 columns. If you change the scrollDirection to
          //     // horizontal, this produces 2 rows.
          //     crossAxisCount: 2,
          //     shrinkWrap: true,
          //     scrollDirection: Axis.vertical,
          //     // Generate 100 widgets that display their index in the List.
          //     children: List.generate(4, (index) {
          //       return Card(
          //         color: Colors.amber,
          //         child: Center(child: Text('$index')),
          //       );
          //     }),
          //   ),
          // ),
        ],
      ),
    );
  }

  void _printLatestValue() {
    var t = _searchController.text.toLowerCase();
    // futureCity = cities.where((a) => a.toString().contains(t)).toList();

    if (t.length > 1) {
      setState(() {
        cities = t;
        futureCity = HttpController().getCityFunc(cities);
      });
    }
  }

  // List cities = [];
}
