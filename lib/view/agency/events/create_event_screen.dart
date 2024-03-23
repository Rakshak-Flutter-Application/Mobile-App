import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rakshak_sos/model/event_model.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';
import 'package:rakshak_sos/view_model/event_view_model.dart';
import 'package:image_picker/image_picker.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? selectedDateTime;
  String? imagePath;
  double uploadProgress = 0.0;

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
        builder: (BuildContext context, Widget? child) {
          return FittedBox(
            child: Theme(
              child: child!,
              data: ThemeData(
                primaryColor: Colors.purple[300],
              ),
            ),
          );
        });

    if (pickedDateTime != null) {
      final TimeOfDay? pickedTimeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTimeOfDay != null) {
        setState(() {
          selectedDateTime = DateTime(
            pickedDateTime.year,
            pickedDateTime.month,
            pickedDateTime.day,
            pickedTimeOfDay.hour,
            pickedTimeOfDay.minute,
          );
        });
      }
    }
  }

  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      imagePath = image!.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              style: TextStyle(fontSize: 18.0, color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Event Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(16.0),
                labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _selectDateTime(context),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedDateTime == null
                          ? 'Select Date and Time'
                          : '${DateFormat('MMMM dd, yyyy - hh:mm a').format(selectedDateTime!)}',
                      style: TextStyle(
                        fontSize: 18.0, // Increase the font size as needed
                        color: selectedDateTime == null
                            ? Colors.grey
                            : Colors.black,
                      ),
                    ),
                    Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Event Description',
                labelStyle: TextStyle(
                  fontSize: 18.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              maxLines: 3,
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final title = _titleController.text;
                final description = _descriptionController.text;
                final imageUrl = imagePath ?? '';

                if (title.isNotEmpty && selectedDateTime != null) {
                  final eventProvider =
                      Provider.of<EventProvider>(context, listen: false);

                  eventProvider.addEvent(
                    Event(
                      title: title,
                      date: selectedDateTime!,
                      description: description,
                      imageUrl: 'assets/ndrf_logo.jpg',
                    ),
                  );

                  Navigator.pushNamed(context, RoutesName.agency_event);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please fill in all required fields.'),
                    ),
                  );
                }
              },
              child: const Text('Save Event'),
            ),
            const SizedBox(height: 20),
            if (_image == null)
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Upload Image'),
              ),
            if (_image != null)
              Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Event Image',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(15), // Circular border radius
                    child: Image.file(
                      File(_image!.path),
                      width: 150,
                      height: 150,
                    ),
                  ),
                ],
              ),
            if (uploadProgress > 0.0)
              LinearProgressIndicator(
                value: uploadProgress,
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
