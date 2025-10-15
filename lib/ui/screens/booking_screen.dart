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

  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        child: SafeArea(child: Column(children: [])),
      ),
    );
  }
}
