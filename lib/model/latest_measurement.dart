// To parse this JSON data, do
//
//     final latestMeasurement = latestMeasurementFromJson(jsonString);

// LatestMeasurement latestMeasurementFromJson(String str) =>
//     LatestMeasurement.fromJson(json.decode(str));

// String latestMeasurementToJson(LatestMeasurement data) =>
//     json.encode(data.toJson());

class LatestMeasurement {
  DateTime? timeOnly;
  String? measuringValue;

  LatestMeasurement({
    this.timeOnly,
    this.measuringValue,
  });

  factory LatestMeasurement.fromJson(Map<String, dynamic> json) =>
      LatestMeasurement(
        timeOnly:
            json["TimeOnly"] == null ? null : DateTime.parse(json["TimeOnly"]),
        measuringValue: json["MeasuringValue"],
      );

  Map<String, dynamic> toJson() => {
        "TimeOnly": timeOnly?.toIso8601String(),
        "MeasuringValue": measuringValue,
      };
}
