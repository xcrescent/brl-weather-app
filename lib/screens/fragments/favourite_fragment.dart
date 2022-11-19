import 'package:flutter/material.dart';
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
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_printLatestValue);
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
              obscureText: true,
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

  void _printLatestValue() {}
}
