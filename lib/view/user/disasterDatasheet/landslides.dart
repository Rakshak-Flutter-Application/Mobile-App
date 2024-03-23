import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rakshak_sos/res/color.dart';

class Landslides extends StatefulWidget {
  const Landslides({super.key});

  @override
  State<Landslides> createState() => _LandslidesState();
}

class _LandslidesState extends State<Landslides> {
  List<List<dynamic>> _data = [];

  void _loadCSV() async {
    final _rawData =
        await rootBundle.loadString("assets/csv_files/landslides.csv");
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
          "Landslides",
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
