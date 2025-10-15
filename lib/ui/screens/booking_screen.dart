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
    fetchAirportData();
  }

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
              _buildTopButtomGroup(),
              SizedBox(height: 32),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopButtomGroup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Icon(Icons.flight_sharp, color: Colors.green, size: 32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Icon(Icons.home_work, color: Colors.green, size: 32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Icon(Icons.ac_unit, color: Colors.green, size: 32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Icon(
            Icons.baby_changing_station,
            color: Colors.green,
            size: 32,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
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
