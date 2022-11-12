// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

// String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.cityName,
    required this.data,
    required this.stateCode,
    required this.timezone,
    required this.lon,
    required this.countryCode,
    required this.lat,
  });

  String cityName;
  List<Datum> data;
  String stateCode;
  String timezone;
  double lon;
  String countryCode;
  double lat;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        cityName: json["city_name"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        stateCode: json["state_code"],
        timezone: json["timezone"],
        lon: json["lon"].toDouble(),
        countryCode: json["country_code"],
        lat: json["lat"].toDouble(),
      );

  // Map<String, dynamic> toJson() => {
  //       "city_name": cityName,
  //       "data": List<dynamic>.from(data.map((x) => x.toJson())),
  //       "state_code": stateCode,
  //       "timezone": timezone,
  //       "lon": lon,
  //       "country_code": countryCode,
  //       "lat": lat,
      // };
}

class Datum {
  Datum({
    required this.snowDepth,
    required this.pop,
    required this.ozone,
    required this.cloudsHi,
    required this.cloudsLow,
    required this.cloudsMid,
    required this.windCdir,
    required this.rh,
    required this.pod,
    required this.pres,
    required this.clouds,
    required this.vis,
    required this.windSpd,
    required this.windCdirFull,
    required this.slp,
    required this.datetime,
    required this.ts,
    required this.timestampUtc,
    required this.windGustSpd,
    required this.timestampLocal,
    required this.uv,
    required this.snow,
    required this.windDir,
    required this.ghi,
    required this.dhi,
    required this.precip,
    required this.dni,
    required this.weather,
    required this.solarRad,
    required this.temp,
    required this.dewpt,
    required this.appTemp,
  });

  int snowDepth;
  int pop;
  double ozone;
  int cloudsHi;
  int cloudsLow;
  int cloudsMid;
  String windCdir;
  int rh;
  Pod? pod;
  double pres;
  int clouds;
  double vis;
  double windSpd;
  String windCdirFull;
  double slp;
  String datetime;
  int ts;
  DateTime timestampUtc;
  double windGustSpd;
  DateTime timestampLocal;
  double uv;
  int snow;
  int windDir;
  double ghi;
  double dhi;
  double precip;
  double dni;
  Weather weather;
  double solarRad;
  double temp;
  double dewpt;
  double appTemp;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        snowDepth: json["snow_depth"],
        pop: json["pop"],
        ozone: json["ozone"].toDouble(),
        cloudsHi: json["clouds_hi"],
        cloudsLow: json["clouds_low"],
        cloudsMid: json["clouds_mid"],
        windCdir: json["wind_cdir"],
        rh: json["rh"],
        pod: podValues.map[json["pod"]],
        pres: json["pres"].toDouble(),
        clouds: json["clouds"],
        vis: json["vis"].toDouble(),
        windSpd: json["wind_spd"].toDouble(),
        windCdirFull: json["wind_cdir_full"],
        slp: json["slp"].toDouble(),
        datetime: json["datetime"],
        ts: json["ts"],
        timestampUtc: DateTime.parse(json["timestamp_utc"]),
        windGustSpd: json["wind_gust_spd"].toDouble(),
        timestampLocal: DateTime.parse(json["timestamp_local"]),
        uv: json["uv"].toDouble(),
        snow: json["snow"],
        windDir: json["wind_dir"],
        ghi: json["ghi"].toDouble(),
        dhi: json["dhi"].toDouble(),
        precip: json["precip"].toDouble(),
        dni: json["dni"].toDouble(),
        weather: Weather.fromJson(json["weather"]),
        solarRad: json["solar_rad"].toDouble(),
        temp: json["temp"].toDouble(),
        dewpt: json["dewpt"].toDouble(),
        appTemp: json["app_temp"].toDouble(),
      );

  // Map<String, dynamic> toJson() => {
  //       "snow_depth": snowDepth,
  //       "pop": pop,
  //       "ozone": ozone,
  //       "clouds_hi": cloudsHi,
  //       "clouds_low": cloudsLow,
  //       "clouds_mid": cloudsMid,
  //       "wind_cdir": windCdir,
  //       "rh": rh,
  //       "pod": podValues.reverse[pod],
  //       "pres": pres,
  //       "clouds": clouds,
  //       "vis": vis,
  //       "wind_spd": windSpd,
  //       "wind_cdir_full": windCdirFull,
  //       "slp": slp,
  //       "datetime": datetime,
  //       "ts": ts,
  //       "timestamp_utc": timestampUtc.toIso8601String(),
  //       "wind_gust_spd": windGustSpd,
  //       "timestamp_local": timestampLocal.toIso8601String(),
  //       "uv": uv,
  //       "snow": snow,
  //       "wind_dir": windDir,
  //       "ghi": ghi,
  //       "dhi": dhi,
  //       "precip": precip,
  //       "dni": dni,
  //       "weather": weather.toJson(),
  //       "solar_rad": solarRad,
  //       "temp": temp,
  //       "dewpt": dewpt,
  //       "app_temp": appTemp,
  //     };
}

enum Pod { D, N }

final podValues = EnumValues({"d": Pod.D, "n": Pod.N});

class Weather {
  Weather({
    required this.icon,
    required this.description,
    required this.code,
  });

  String icon;
  Description? description;
  int code;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        icon: json["icon"],
        description: descriptionValues.map[json["description"]],
        code: json["code"],
      );

  // Map<String, dynamic> toJson() => {
  //       "icon": icon,
  //       "description": descriptionValues.reverse[description],
  //       "code": code,
  //     };
}

enum Description {
  FEW_CLOUDS,
  CLEAR_SKY,
  OVERCAST_CLOUDS,
  SCATTERED_CLOUDS,
  LIGHT_SHOWER_RAIN,
  DRIZZLE
}

final descriptionValues = EnumValues({
  "Clear Sky": Description.CLEAR_SKY,
  "Drizzle": Description.DRIZZLE,
  "Few clouds": Description.FEW_CLOUDS,
  "Light shower rain": Description.LIGHT_SHOWER_RAIN,
  "Overcast clouds": Description.OVERCAST_CLOUDS,
  "Scattered clouds": Description.SCATTERED_CLOUDS
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
