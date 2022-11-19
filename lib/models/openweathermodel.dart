// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

// class OpenWeatherForecast  {
Welcome openWeatherForecastFromJson(String str) =>
    Welcome.fromJson(json.decode(str));
String openWeatherForecastToJson(Welcome data) => json.encode(data.toJson());
// }

class Welcome {
  Welcome({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  String cod;
  int message;
  int cnt;
  List<ListElement> list;
  City city;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
        city: City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "city": city.toJson(),
      };
}

class City {
  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  int id;
  String name;
  Coord coord;
  String country;
  int population;
  int timezone;
  int sunrise;
  int sunset;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        coord: Coord.fromJson(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coord": coord.toJson(),
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Coord {
  Coord({
    required this.lat,
    required this.lon,
  });

  double lat;
  double lon;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}

class ListElement {
  ListElement({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
    required this.rain,
  });

  int dt;
  MainClass main;
  List<Weather> weather;
  Clouds clouds;
  Wind wind;
  int visibility;
  double pop;
  Sys sys;
  DateTime dtTxt;
  Rain? rain;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        dt: json["dt"],
        main: MainClass.fromJson(json["main"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: Clouds.fromJson(json["clouds"]),
        wind: Wind.fromJson(json["wind"]),
        visibility: json["visibility"],
        pop: json["pop"].toDouble(),
        sys: Sys.fromJson(json["sys"]),
        dtTxt: DateTime.parse(json["dt_txt"]),
        rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "clouds": clouds.toJson(),
        "wind": wind.toJson(),
        "visibility": visibility,
        "pop": pop,
        "sys": sys.toJson(),
        "dt_txt": dtTxt.toIso8601String(),
        "rain": rain == null ? null : rain!.toJson(),
      };
}

class Clouds {
  Clouds({
    required this.all,
  });

  int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class MainClass {
  MainClass({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int seaLevel;
  int grndLevel;
  int humidity;
  double tempKf;

  factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
      };
}

class Rain {
  Rain({
    required this.the3H,
  });

  double the3H;

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the3H: json["3h"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "3h": the3H,
      };
}

class Sys {
  Sys({
    required this.pod,
  });

  Pod? pod;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        pod: podValues.map[json["pod"]],
      );

  Map<String, dynamic> toJson() => {
        "pod": podValues.reverse[pod],
      };
}

enum Pod { N, D }

final podValues = EnumValues({"d": Pod.D, "n": Pod.N});

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  int id;
  MainEnum? main;
  String description;
  String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: mainEnumValues.map[json["main"]],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": mainEnumValues.reverse[main],
        "description": description,
        "icon": icon,
      };
}

enum MainEnum { CLOUDS, RAIN, CLEAR }

final mainEnumValues = EnumValues({
  "Clear": MainEnum.CLEAR,
  "Clouds": MainEnum.CLOUDS,
  "Rain": MainEnum.RAIN
});

class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  double speed;
  int deg;
  double gust;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
        gust: json["gust"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}

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

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

WelcomeCurrent OpenWeatherCurrentFromJson(String str) =>
    WelcomeCurrent.fromJson(json.decode(str));

String OpenWeatherCurrentToJson(WelcomeCurrent data) =>
    json.encode(data.toJson());

class WelcomeCurrent {
  WelcomeCurrent({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  CoordCurrent coord;
  List<WeatherCurrent> weather;
  String base;
  MainCurrent main;
  int visibility;
  WindCurrent wind;
  CloudsCurrent clouds;
  int dt;
  SysCurrent sys;
  int timezone;
  int id;
  String name;
  int cod;

  factory WelcomeCurrent.fromJson(Map<String, dynamic> json) => WelcomeCurrent(
        coord: CoordCurrent.fromJson(json["coord"]),
        weather: List<WeatherCurrent>.from(
            json["weather"].map((x) => WeatherCurrent.fromJson(x))),
        base: json["base"],
        main: MainCurrent.fromJson(json["main"]),
        visibility: json["visibility"],
        wind: WindCurrent.fromJson(json["wind"]),
        clouds: CloudsCurrent.fromJson(json["clouds"]),
        dt: json["dt"],
        sys: SysCurrent.fromJson(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );

  Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base,
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        "clouds": clouds.toJson(),
        "dt": dt,
        "sys": sys.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };
}

class CloudsCurrent {
  CloudsCurrent({
    required this.all,
  });

  int all;

  factory CloudsCurrent.fromJson(Map<String, dynamic> json) => CloudsCurrent(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class CoordCurrent {
  CoordCurrent({
    required this.lon,
    required this.lat,
  });

  double lon;
  double lat;

  factory CoordCurrent.fromJson(Map<String, dynamic> json) => CoordCurrent(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class MainCurrent {
  MainCurrent({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;
  int seaLevel;
  int grndLevel;

  factory MainCurrent.fromJson(Map<String, dynamic> json) => MainCurrent(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
      };
}

class SysCurrent {
  SysCurrent({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  int type;
  int id;
  String country;
  int sunrise;
  int sunset;

  factory SysCurrent.fromJson(Map<String, dynamic> json) => SysCurrent(
        type: json["type"],
        id: json["id"],
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class WeatherCurrent {
  WeatherCurrent({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  int id;
  String main;
  String description;
  String icon;

  factory WeatherCurrent.fromJson(Map<String, dynamic> json) => WeatherCurrent(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class WindCurrent {
  WindCurrent({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  double speed;
  int deg;
  double gust;

  factory WindCurrent.fromJson(Map<String, dynamic> json) => WindCurrent(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
        gust: json["gust"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}









WelcomeDaily welcomeDailyFromJson(String str) => WelcomeDaily.fromJson(json.decode(str));

String welcomeDailyToJson(WelcomeDaily data) => json.encode(data.toJson());

class WelcomeDaily {
    WelcomeDaily({
        required this.city,
        required this.cod,
        required this.message,
        required this.cnt,
        required this.list,
    });

    CityDaily city;
    String cod;
    double message;
    int cnt;
    List<ListElementDaily> list;

    factory WelcomeDaily.fromJson(Map<String, dynamic> json) => WelcomeDaily(
        city: CityDaily.fromJson(json["city"]),
        cod: json["cod"],
        message: json["message"].toDouble(),
        cnt: json["cnt"],
        list: List<ListElementDaily>.from(json["list"].map((x) => ListElementDaily.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "city": city.toJson(),
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
    };
}

class CityDaily {
    CityDaily({
        required this.id,
        required this.name,
        required this.coord,
        required this.country,
        required this.population,
        required this.timezone,
    });

    int id;
    String name;
    CoordDaily coord;
    String country;
    int population;
    int timezone;

    factory CityDaily.fromJson(Map<String, dynamic> json) => CityDaily(
        id: json["id"],
        name: json["name"],
        coord: CoordDaily.fromJson(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coord": coord.toJson(),
        "country": country,
        "population": population,
        "timezone": timezone,
    };
}

class CoordDaily {
    CoordDaily({
        required this.lon,
        required this.lat,
    });

    double lon;
    double lat;

    factory CoordDaily.fromJson(Map<String, dynamic> json) => CoordDaily(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
    };
}

class ListElementDaily {
    ListElementDaily({
        required this.dt,
        required this.sunrise,
        required this.sunset,
        required this.temp,
        required this.feelsLike,
        required this.pressure,
        required this.humidity,
        required this.weather,
        required this.speed,
        required this.deg,
        required this.gust,
        required this.clouds,
        required this.pop,
        required this.rain,
    });

    int dt;
    int sunrise;
    int sunset;
    TempDaily temp;
    FeelsLikeDaily feelsLike;
    int pressure;
    int humidity;
    List<WeatherDaily> weather;
    double speed;
    int deg;
    double gust;
    int clouds;
    double pop;
    double? rain;

    factory ListElementDaily.fromJson(Map<String, dynamic> json) => ListElementDaily(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: TempDaily.fromJson(json["temp"]),
        feelsLike: FeelsLikeDaily.fromJson(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        weather: List<WeatherDaily>.from(json["weather"].map((x) => WeatherDaily.fromJson(x))),
        speed: json["speed"].toDouble(),
        deg: json["deg"],
        gust: json["gust"].toDouble(),
        clouds: json["clouds"],
        pop: json["pop"].toDouble(),
        rain: json["rain"],
    );

    Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp.toJson(),
        "feels_like": feelsLike.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "speed": speed,
        "deg": deg,
        "gust": gust,
        "clouds": clouds,
        "pop": pop,
        "rain": rain!,
    };
}

class FeelsLikeDaily {
    FeelsLikeDaily({
        required this.day,
        required this.night,
        required this.eve,
        required this.morn,
    });

    double day;
    double night;
    double eve;
    double morn;

    factory FeelsLikeDaily.fromJson(Map<String, dynamic> json) => FeelsLikeDaily(
        day: json["day"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
    };
}

class TempDaily {
    TempDaily({
        required this.day,
        required this.min,
        required this.max,
        required this.night,
        required this.eve,
        required this.morn,
    });

    double day;
    double min;
    double max;
    double night;
    double eve;
    double morn;

    factory TempDaily.fromJson(Map<String, dynamic> json) => TempDaily(
        day: json["day"].toDouble(),
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
    };
}

class WeatherDaily {
    WeatherDaily({
        required this.id,
        required this.main,
        required this.description,
        required this.icon,
    });

    int id;
    String main;
    String description;
    String icon;

    factory WeatherDaily.fromJson(Map<String, dynamic> json) => WeatherDaily(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
    };
}
