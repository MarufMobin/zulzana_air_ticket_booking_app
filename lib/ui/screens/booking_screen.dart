import 'package:flutter/material.dart';
import 'package:zulzana_air_travel/controller/airport_controller.dart';
import 'package:zulzana_air_travel/model/airport_model.dart';
import 'package:zulzana_air_travel/ui/widgets/background_screen.dart';
import 'package:advanced_searchable_dropdown/advanced_searchable_dropdown.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  // Airport Controller are call here
  final AirportController _airportController = AirportController();
  TextEditingController controller = TextEditingController();
  String query = '';

  // Fetch data are stay in array
  List<AirportModel> _airportData = [];

  // there are some use able variables
  String? _fromAirport;
  String? _toAirport;
  DateTime? _selectedDate;
  int _passengerCount = 1;

  // Data Fetch are here by function
  Future<void> loadAirportData() async {
    final data = await _airportController.fetchAirportData();
    setState(() {
      _airportData = data;
    });
  }

  void _swapAirports() {
    setState(() {
      final temp = _fromAirport;
      _fromAirport = _toAirport;
      _toAirport = temp;
    });
  }

  @override
  void initState() {
    super.initState();
    loadAirportData();
  }

  void _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }
  void _showMyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ZulZana Air Ticket Invoice', style: TextStyle(
            color: Colors.green,
          ),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Text('User Going From ${_fromAirport}',style: TextStyle(
                fontSize: 18,
              ),),
              Text('User Going TO ${_toAirport}',style: TextStyle(
                fontSize: 18,
              ),),
              Text('User Going From ${_selectedDate}',style: TextStyle(
                fontSize: 14,
              ),),
              Text('User Going From ${_passengerCount}',style: TextStyle(
                fontSize: 18,
              ),),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // closes the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add your action here
                Navigator.of(context).pop(); // closes the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SearchableDropDown(
                  menuList: _airportData
                      .map(
                        (e) => SearchableDropDownItem(
                          label: e.airportName.toString(),
                          value: e.airportName
                              .toString(), // make value same type as _fromAirport
                        ),
                      )
                      .toList(),
                  value: _fromAirport,
                  hintText: "Select From Airport",
                  onSelected: (item) {
                    setState(() {
                      _fromAirport = item.value; // use value here
                    });
                    // print("From Airport: ${item.value}");
                  },
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.swap_vert_outlined,
                  color: Colors.green,
                  size: 32,
                ),
                onPressed: _swapAirports,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SearchableDropDown(
                  menuList: _airportData
                      .map(
                        (e) => SearchableDropDownItem(
                          label: e.airportName.toString(),
                          value: e.airportName
                              .toString(), // same type as _toAirport
                        ),
                      )
                      .toList(),
                  value: _toAirport,
                  hintText: "Select To Airport",
                  onSelected: (item) {
                    setState(() {
                      _toAirport = item.value;
                    });
                    // print("To Airport: ${item.value}");
                  },
                ),
              ),
              SizedBox(height: 32),
              _buildDatePicker(),
              _buildPassengerSelector(),
              SizedBox(height: 32),
              SizedBox(
                width: double.maxFinite,

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: ()=> _showMyDialog(context),

                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFF228B22),
                      ),
                    ),
                    child: Icon(Icons.search, color: Colors.white, size: 32),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectPassengers() async {
    int tempCount = _passengerCount;
    await showModalBottomSheet(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setStateModal) {
          return Container(
            padding: const EdgeInsets.all(16),
            height: 200,
            child: Column(
              children: [
                const Text(
                  'Select Passengers',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (tempCount > 1) setStateModal(() => tempCount--);
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$tempCount', style: const TextStyle(fontSize: 20)),
                    IconButton(
                      onPressed: () {
                        setStateModal(() => tempCount++);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() => _passengerCount = tempCount);
                  },
                  child: const Text('Done'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDatePicker() {
    return ListTile(
      onTap: _pickDate,
      leading: const Icon(Icons.calendar_today, color: Colors.green),
      title: Text(
        _selectedDate == null
            ? 'Select Departure Date'
            : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
      ),
    );
  }

  Widget _buildPassengerSelector() {
    return ListTile(
      onTap: _selectPassengers,
      leading: const Icon(Icons.person, color: Colors.green),
      title: Text('Passengers: $_passengerCount'),
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
