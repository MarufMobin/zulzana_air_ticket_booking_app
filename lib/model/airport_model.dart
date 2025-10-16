class AirportModel {
  String? code;
  String? airportName;
  String? cityName;
  String? cityCode;
  String? countryName;
  String? searchContents;

  AirportModel(
      {this.code,
        this.airportName,
        this.cityName,
        this.cityCode,
        this.countryName,
        this.searchContents});

  AirportModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    airportName = json['airport_name'];
    cityName = json['city_name'];
    cityCode = json['city_code'];
    countryName = json['country_name'];
    searchContents = json['search_contents'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['airport_name'] = this.airportName;
    data['city_name'] = this.cityName;
    data['city_code'] = this.cityCode;
    data['country_name'] = this.countryName;
    data['search_contents'] = this.searchContents;
    return data;
  }
}