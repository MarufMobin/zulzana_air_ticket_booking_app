import 'package:flutter/material.dart';
import 'package:zulzana_air_travel/app.dart';

void main( ) => runApp( const MyApp());

//
// import 'package:flutter/material.dart';
// import 'package:advanced_searchable_dropdown/advanced_searchable_dropdown.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'package:zulzana_air_travel/model/airport_model.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   List<AirportModel> airportData = [];
//
//   Future<void> fetchData() async {
//     final response = await http.get(
//       Uri.parse(
//         'https://enterpise.s3.ap-southeast-1.amazonaws.com/resources/airport.json',
//       ),
//     );
//     if (response.statusCode == 200) {
//       final List jsonList = jsonDecode(response.body);
//       airportData = jsonList
//           .map((e) => AirportModel.fromJson(e))
//           .toList();
//     } else {
//       throw Exception('Some Network issue when fetching Data form Api');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Searchable Dropdown')),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SearchableDropDown(
//
//             // menuList: [
//             //   SearchableDropDownItem(label: "Apple", value: 1),
//             //   SearchableDropDownItem(label: "Banana", value: 2),
//             //   SearchableDropDownItem(label: "Cherry", value: 3),
//             //   SearchableDropDownItem(label: "Date", value: 4),
//             // ],
//             menuList: airportData.map((e) => SearchableDropDownItem(label: e.airportName.toString(), value: 1)).toList(),
//             value: 1,
//             hintText: "Select a fruit",
//             onSelected: (item) {
//               print("Selected: ${item.label}");
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
