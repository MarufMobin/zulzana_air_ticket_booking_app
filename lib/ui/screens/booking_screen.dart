import 'package:flutter/material.dart';
import 'package:zulzana_air_travel/ui/widgets/background_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  List<dynamic> airportData = [];

  // Future<List<AirportModel>> fetchAirportData() async {
  //   final response = await http.get(
  //     Uri.parse(
  //       'https://enterpise.s3.ap-southeast-1.amazonaws.com/resources/airport.json',
  //     ),
  //   );
  //   airportData = jsonDecode(response.body);
  //
  //   return airportData;
  // }

  Future<void> fetchAirportData() async {
    final response = await http.get(
      Uri.parse(
        'https://enterpise.s3.ap-southeast-1.amazonaws.com/resources/airport.json',
      ),
    );
    airportData = jsonDecode(response.body);

  }
  @override
  void initState() {
    super.initState();
    setState(() {
      fetchAirportData();
    });
  }

  final String airportFromValue = '';
  final String airportToValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: BackgroundScreen(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 32),
              _buildTopButtonGroup(),
              SizedBox(height: 32),

              // Expanded(
              //   child: ListView.builder(
              //     itemCount: airportData.length,
              //     itemBuilder: (context, index) {
              //       return Card(
              //         child: Text(airportData[index].airportName.toString()),
              //       );
              //     }
              //   ),
              // ),
              //

              // Expanded(
              //   child: DropdownButtonFormField(
              //     value: airportFromValue,
              //     items: airportData
              //         .map((e) => DropdownMenuItem(child: Text(e['airport_name']), value: e['airport_name']))
              //         .toList(),
              //     onChanged: (value){
              //       setState(() {
              //         // airportFromValue = value;
              //       });
              //     },
              //   ),
              // ),
              //{
              // code: 00J,
              // airport_name: Georgia Pacific,
              // city_name: Cedar Springs,
              // city_code: ,
              // country_name: United States, search_contents: 00J - Georgia Pacific - Cedar Springs, United States}
              // Expanded(
              //   child: DropdownButtonFormField(
              //     items: airportData
              //         .map((e) => DropdownMenuItem(child: Text(e['airport_name']), value: e['airport_name']))
              //         .toList(),
              //     onChanged: (value) => value!,
              //   ),
              // ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: airportData.length,
              //     itemBuilder: (context, index) {
              //       final data = airportData[index];
              //       return Card(child: Text(data));
              //     },
              //   ),
              // ),
              // Expanded(child: ListView.builder(
              //   itemCount: airportData.length,
              //     itemBuilder: (context,index){
              //   return Card(
              //     child: Text(airportData[index]['airport_name'].toString()),
              //   );
              // }))

              // DropdownButtonFormField(
              //   items: categories
              //       .map(
              //         (category) => DropdownMenuItem(
              //       value: category,
              //       child: Text(category),
              //     ),
              //   )
              //       .toList(),
              //   onChanged: (value) => selectedCategory = value!,
              //   decoration: InputDecoration(labelText: 'Please Selected One'),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: DropdownButtonFormField(
              //
              //     items: airportData
              //         .map(
              //           (elm) => DropdownMenuItem(
              //             child: Text(elm['airport_name']),
              //             value: elm['airport_name'],
              //           ),
              //         )
              //         .toList(),
              //     onChanged: (value) {},
              //   ),
              // ),

              Expanded(
                child: ListView.builder(
                  itemCount: airportData.length,
                  itemBuilder: (context,index){
                    final dt = airportData[index];
                    return Card(
                      child: Text(  dt['airport_name']?? ''),
                    );
                  },
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopButtonGroup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(Icons.flight_sharp, color: Colors.green, size: 32),
        ),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(Icons.home_work, color: Colors.green, size: 32),
        ),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(Icons.ac_unit, color: Colors.green, size: 32),
        ),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            Icons.baby_changing_station,
            color: Colors.green,
            size: 32,
          ),
        ),
      ],
    );
  }

  // App Bar are start here
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(
        'ZulZana Air Ticket',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: Colors.green,
        ),
      ),
      centerTitle: true,
    );
  }

  // App Bar are end here
}
