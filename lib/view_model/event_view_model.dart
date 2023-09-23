import 'package:flutter/foundation.dart';
import 'package:rakshak_sos/model/event_model.dart';

class EventProvider with ChangeNotifier {
  final List<Event> pastEvents = [
    Event(
        title: 'Event 1',
        date: DateTime(2022, 9, 30),
        description:
            "Join us for an exciting outdoor adventure filled with fun activities and great company. Don't miss out on this memorable experience!",
        imageUrl: 'assets/ndrf_logo.jpg',
        isPastEvent: true),
    Event(
        title: 'Event 2',
        date: DateTime(2021, 10, 15),
        description:
            "Join us for an exciting outdoor adventure filled with fun activities and great company. Don't miss out on this memorable experience!",
        imageUrl: 'assets/ndrf_logo.jpg',
        isPastEvent: true),
  ];

  final List<Event> _events = [
    Event(
        title: 'Earthquake Drill',
        date: DateTime(2023, 10, 15, 18, 0),
        imageUrl: 'assets/ndrf_logo.jpg',
        description:
            'An earthquake drill is a simulated exercise designed to educate and prepare individuals or organizations on how to respond and stay safe during an earthquake. It involves practicing actions like "Drop, Cover, and Hold On" to reduce injuries and damage during a seismic event.',
        isPastEvent: false),
    Event(
        title: 'Flood Measures',
        date: DateTime(2023, 11, 5, 14, 0),
        description:
            'Flood measures refer to strategies and actions taken to mitigate the impact of flooding, such as building flood defenses, implementing early warning systems, and promoting flood-resistant construction practices, all aimed at reducing flood-related damage and risks to communities.',
        imageUrl: 'assets/ndrf_logo.jpg',
        isPastEvent: false),
    Event(
        title: 'Fire Escape Plan',
        date: DateTime(2023, 12, 8, 12, 30),
        description:
            'A fire escape plan is a prepared strategy outlining routes and actions for safely exiting a building during a fire emergency, ensuring the swift evacuation and protection of occupants. It typically includes designated exits, meeting points, and fire safety procedures.',
        imageUrl: 'assets/ndrf_logo.jpg',
        isPastEvent: false),
    Event(
      title: 'Event 1',
      date: DateTime(2022, 9, 30),
      description:
          "Join us for an exciting outdoor adventure filled with fun activities and great company. Don't miss out on this memorable experience!",
      imageUrl: 'assets/ndrf_logo.jpg',
    ),
    Event(
      title: 'Event 2',
      date: DateTime(2021, 10, 15),
      description:
          "Join us for an exciting outdoor adventure filled with fun activities and great company. Don't miss out on this memorable experience!",
      imageUrl: 'assets/ndrf_logo.jpg',
    ),
  ];

  List<Event> get events => _events;

  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }

  void removeEvent(Event event) {
    _events.remove(event);
    notifyListeners();
  }
}
