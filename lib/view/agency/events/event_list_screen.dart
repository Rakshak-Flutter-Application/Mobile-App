import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';
import 'package:rakshak_sos/utils/utils.dart';
import 'package:rakshak_sos/view_model/event_view_model.dart';

import '../../../model/event_model.dart';

class AgencyEventScren extends StatefulWidget {
  const AgencyEventScren({super.key});

  @override
  State<AgencyEventScren> createState() => _AgencyEventScrenState();
}

class _AgencyEventScrenState extends State<AgencyEventScren> {
  Future<List<Event>> fetchUserPastEvents() async {
    final currentDate = DateTime.now();
    EventProvider eventProvider = Provider.of<EventProvider>(context);
    final events = eventProvider.events;
    final pastEvents =
        events.where((event) => event.date.isBefore(currentDate)).toList();
    for (var event in pastEvents) {
      event.isPastEvent = true;
    } // Set isPastEvent to true for past events
    return pastEvents;
  }

  bool showAllEvents = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textStyle = theme.textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            showAllEvents ? 'All Events' : 'Past Events',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.pushNamed(context, RoutesName.create_event);
          },
          child: Icon(Icons.add),
        ),
        body: Consumer<EventProvider>(builder: (context, eventProvider, child) {
          final events = eventProvider.events;
          final pastEvents = eventProvider.pastEvents;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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

class EventFrontCard extends StatefulWidget {
  final Event event;
  final AnimationController controller;

  const EventFrontCard(
      {super.key, required this.event, required this.controller});

  @override
  State<EventFrontCard> createState() => _EventFrontCardState();
}

class _EventFrontCardState extends State<EventFrontCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EventProvider>(builder: (context, eventProvider, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              widget.event.imageUrl,
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
                  widget.event.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  DateFormat('MMMM dd, yyyy - hh:mm a')
                      .format(widget.event.date),
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
                        if (widget.event.isFlipped) {
                          widget.controller.reverse();
                        } else {
                          widget.controller.forward();
                        }
                        widget.event.isFlipped = !widget.event.isFlipped;
                      },
                      child: const Text('Details'),
                    ),
                    Visibility(
                      visible: !widget.event.isPastEvent,
                      child: ElevatedButton(
                        onPressed: () {
                          eventProvider.removeEvent(widget.event);
                          Navigator.pushNamed(context, RoutesName.agency_event);
                        },
                        child: const Text('Remove'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    });
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
              Text(
                event.description ?? "",
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
