import 'package:http/http.dart' as http;
import 'dart:convert';

Cities citiesFromJson(String str) => Cities.fromJson(json.decode(str));

String citiesToJson(Cities data) => json.encode(data.toJson());

class Cities {
    Cities({
        required this.schema,
    });

    List<Schema> schema;

    factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        schema: List<Schema>.from(json["\u0024schema"].map((x) => Schema.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "\u0024schema": List<dynamic>.from(schema.map((x) => x.toJson())),
    };
}

class Schema {
    Schema({
        required this.city,
        required this.cityAscii,
        required this.lat,
        required this.lng,
        required this.country,
        required this.iso2,
        required this.iso3,
        required this.adminName,
        required this.capital,
        required this.population,
        required this.id,
    });

    String city;
    String cityAscii;
    double lat;
    double lng;
    String country;
    String iso2;
    String iso3;
    String adminName;
    CapitalCities? capital;
    dynamic population;
    int id;

    factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        city: json["city"],
        cityAscii: json["city_ascii"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        country: json["country"],
        iso2: json["iso2"],
        iso3: json["iso3"],
        adminName: json["admin_name"],
        capital: capitalValues.map[json["capital"]],
        population: json["population"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "city_ascii": cityAscii,
        "lat": lat,
        "lng": lng,
        "country": country,
        "iso2": iso2,
        "iso3": iso3,
        "admin_name": adminName,
        "capital": capitalValues.reverse[capital],
        "population": population,
        "id": id,
    };
}

enum CapitalCities { PRIMARY, ADMIN, EMPTY, MINOR }

final capitalValues = EnumValues({
    "admin": CapitalCities.ADMIN,
    "": CapitalCities.EMPTY,
    "minor": CapitalCities.MINOR,
    "primary": CapitalCities.PRIMARY
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}



class citiesData{
  Future<Cities> fetchData(double lat, double lon) async {
    // print(lat + lon);
    // final response = await http.get(Uri.parse(
    //     'https://weatherbit-v1-mashape.p.rapidapi.com/forecast/3hourly?lat=$latitude&lon=$longitude'),headers: {

    // 'X-RapidAPI-Key':
    //           '01c2ba1c7cmshbcf4163cbfc9e28p1f846ajsn6d7542a40d6a',
    //       'X-RapidAPI-Host': 'weatherbit-v1-mashape.p.rapidapi.com'
    // });
    final response = await http.get(Uri.parse(
        ''));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // log(jsonDecode(response.body));
      // print(jsonDecode(response.body));
      return citiesFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }


}