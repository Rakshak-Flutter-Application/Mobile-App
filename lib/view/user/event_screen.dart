// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rakshak_sos/model/event_model.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';
import 'package:rakshak_sos/utils/utils.dart';
import 'package:rakshak_sos/view_model/event_view_model.dart';

class UserEventScreen extends StatefulWidget {
  const UserEventScreen({super.key});

  @override
  State<UserEventScreen> createState() => _UserEventScreenState();
}

class _UserEventScreenState extends State<UserEventScreen> {
  bool showAllEvents = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            showAllEvents ? 'All Events' : 'Past Events',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Consumer<EventProvider>(builder: (context, eventProvider, child) {
          final events = eventProvider.events;
          final pastEvents = eventProvider.pastEvents;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showAllEvents = !showAllEvents;
                    });
                  },
                  child: Text(
                      showAllEvents ? 'Show Past Events' : 'Show All Events'),
                ),
              ),
              SizedBox(
                height: size.height * .72,
                child: !showAllEvents
                    ? ListView.builder(
                        itemCount: pastEvents.length,
                        itemBuilder: (context, index) {
                          final pastEvent = pastEvents[index];
                          return Column(
                            children: [
                              EventCard(event: pastEvent),
                            ],
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: events.length,
                        itemBuilder: (context, index) {
                          final event = events[events.length - index - 1];
                          return Column(
                            children: [
                              EventCard(event: event),
                            ],
                          );
                        },
                      ),
              ),
            ],
          );
        }));
  }
}

class EventCard extends StatefulWidget {
  final Event event;

  // ignore: use_key_in_widget_constructors
  const EventCard({required this.event});

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final frontOpacity = 1 - _animation.value;
          final backOpacity = _animation.value;
          return Stack(
            children: [
              Opacity(
                opacity: frontOpacity,
                child: EventFrontCard(
                  event: widget.event,
                  controller: _controller,
                ),
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY((22 / 7) * _animation.value * 2),
                child: Opacity(
                  opacity: backOpacity,
                  child: EventDetailsCard(
                    event: widget.event,
                    controller: _controller,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class EventFrontCard extends StatelessWidget {
  final Event event;
  final AnimationController controller;

  const EventFrontCard(
      {super.key, required this.event, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: Image.asset(
            event.imageUrl,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                DateFormat('MMMM dd, yyyy - hh:mm a').format(event.date),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Flip the card when the "Details" button is clicked
                      if (event.isFlipped) {
                        controller.reverse();
                      } else {
                        controller.forward();
                      }
                      event.isFlipped = !event.isFlipped;
                    },
                    child: const Text('Details'),
                  ),
                  Visibility(
                    visible: !event.isPastEvent,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Register for Event'),
                              content: const Text(
                                  'Add your registration form here.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    event.register = true;
                                    Utils.toastMessage(
                                        "Registration successful!");
                                    Navigator.pushNamed(
                                        context, RoutesName.user_event);
                                  },
                                  child: const Text('Register'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(event.register ? 'Registered' : 'Register'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EventDetailsCard extends StatelessWidget {
  final Event event;
  final AnimationController controller;

  const EventDetailsCard(
      {super.key, required this.event, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Event Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Description: Add event description here...',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  controller.reverse();
                  event.isFlipped = !event.isFlipped;
                },
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
