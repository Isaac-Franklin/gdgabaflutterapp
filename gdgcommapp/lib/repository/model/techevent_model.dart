class TechEvent {
  final String name;
  final String date;
  final String location;
  final String description;

  TechEvent({
    required this.name,
    required this.date,
    required this.location,
    required this.description,
  });

  @override
  String toString() {
    return 'TechEvent{name: $name, date: $date, location: $location, description: $description}';
  }
}

void main() {
  List<TechEvent> techEventsInAba = [
    TechEvent(
      name: 'Aba Tech Conference 2024',
      date: '2024-08-15',
      location: 'Aba, Abia State',
      description:
          'A conference bringing together tech enthusiasts and professionals in Aba.',
    ),
    TechEvent(
      name: 'Aba Developer Meetup',
      date: '2024-09-10',
      location: 'Aba, Abia State',
      description: 'A meetup for developers to share knowledge and network.',
    ),
    TechEvent(
      name: 'Aba AI & Robotics Workshop',
      date: '2024-10-05',
      location: 'Aba, Abia State',
      description:
          'A workshop focused on AI and Robotics, featuring hands-on sessions.',
    ),
    TechEvent(
      name: 'Aba Startup Pitch Event',
      date: '2024-11-20',
      location: 'Aba, Abia State',
      description:
          'An event for startups to pitch their ideas to investors and mentors.',
    ),
  ];

  // Print the list of tech events
  techEventsInAba.forEach((event) {
    print(event);
  });
}
