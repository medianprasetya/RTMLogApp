class ListDetailHome {
  String? deviceID;
  String? deviceName;
  String? measuringValue;
  String? measuringTime;
  String? upperLimit;
  String? lowerLimit;

  ListDetailHome(
      {this.deviceID,
      this.deviceName,
      this.measuringValue,
      this.measuringTime,
      this.upperLimit,
      this.lowerLimit});

  factory ListDetailHome.fromJson(Map<String, dynamic> json) {
    return ListDetailHome(
      deviceID: json['DeviceID'] ?? '',
      deviceName: json['DeviceName'] ?? '',
      measuringValue: json['MeasuringValue'] ?? '',
      measuringTime: json['MeasuringTime'] ?? '',
      upperLimit: json['UpperLimit'] ?? '',
      lowerLimit: json['LowerLimit'] ?? '',
    );
  }
}
