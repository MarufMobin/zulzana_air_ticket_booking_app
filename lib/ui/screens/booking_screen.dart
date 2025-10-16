import 'package:flutter/material.dart';
import 'package:zulzana_air_travel/controller/airport_controller.dart';
import 'package:zulzana_air_travel/model/airport_model.dart';
import 'package:zulzana_air_travel/ui/widgets/background_screen.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  // Airport Controller are call here
  final AirportController _airportController = AirportController();

  // Fetch data are stay in array
  List<AirportModel> _airportData = [];

  bool _isLoading = true;

  // Data Fetch are here by function
  Future<void> loadAirportData() async {
    final data = await _airportController.fetchAirportData();
    setState(() {
      _airportData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    loadAirportData();
    super.initState();
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
              _buildTopButtonGroup(),
              SizedBox(height: 32),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Text('Data find'),
              Expanded(
                child: ListView.builder(
                  itemCount: _airportData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Text(_airportData.first.countryName.toString()),
                    );
                  }
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
