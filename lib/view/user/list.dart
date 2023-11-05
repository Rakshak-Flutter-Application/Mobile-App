import 'package:flutter/material.dart';
import 'package:rakshak_sos/res/color.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

class list extends StatefulWidget {
  const list({super.key});

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.buttonColor,
        centerTitle: true,
        title: Text(
          "Disaster Datasheet",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.width * .1,
                //color: Colors.amber[600],
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.cyclone);
                  },
                  child: Text(
                    'Cyclone',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.width * .1,
                //color: Colors.amber[600],
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.earthquake);
                  },
                  child: Text(
                    'Earthquake',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.width * .1,
                //color: Colors.amber[600],
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.fire);
                  },
                  child: Text(
                    'Fire',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.width * .1,
                //color: Colors.amber[600],
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.flight);
                  },
                  child: Text(
                    'Flight Crashes',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.width * .1,
                //color: Colors.amber[600],
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.floods);
                  },
                  child: Text(
                    'Floods',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.width * .1,
                //color: Colors.amber[600],
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.landslides);
                  },
                  child: Text(
                    'Landslides',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.width * .1,
                //color: Colors.amber[600],
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.rail);
                  },
                  child: Text(
                    'Rail Disaster',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.width * .1,
                //color: Colors.amber[600],
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.others);
                  },
                  child: Text(
                    'Other',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
