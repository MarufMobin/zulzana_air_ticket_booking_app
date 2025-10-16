import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zulzana_air_travel/model/airport_model.dart';

class AirportController{
  Future<List<AirportModel>> fetchAirportData() async{
    final response = await http.get(Uri.parse('https://enterpise.s3.ap-southeast-1.amazonaws.com/resources/airport.json'));

    if( response.statusCode == 200 ){
      final List jsonList = jsonDecode(response.body);
      return jsonList.map((e)=>AirportModel.fromJson(e)).toList();
    }else{
      throw Exception('Some Network issue when fatching Data form Api');
    }
  }
}
