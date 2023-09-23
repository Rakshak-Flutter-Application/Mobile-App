import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rakshak_sos/res/color.dart';

class Flight extends StatefulWidget {
  const Flight({super.key});

  @override
  State<Flight> createState() => _FlightState();
}

class _FlightState extends State<Flight> {
  List<List<dynamic>> _data = [];

  void _loadCSV() async {
    final _rawData =
        await rootBundle.loadString("assets/csv_files/Flight_Crashes.csv");
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);
    setState(() {
      _data = _listData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.buttonColor,
        centerTitle: true,
        title: Text(
          "Flight Crashes",
        ),
      ),
      body: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (_, index) {
            return Card(
              margin: const EdgeInsets.all(3),
              color: index == 0 ? Colors.amber : Colors.white,
              child: ListTile(
                leading: Text(_data[index][0].toString()),
                title: Text(_data[index][1].toString()),
                trailing: Text(_data[index][2].toString()),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadCSV,
        child: Icon(Icons.add),
      ),
    );
  }
}
