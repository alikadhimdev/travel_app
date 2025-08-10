enum Season { winter, spring, summer, autumn }

enum TripType { exploration, recovery, activities, therapy }

class Trip {
  final String id;
  final List<String> categories;
  final String title;
  final TripType tripType;
  final Season season;
  final String imageUrl;
  final int duration;
  final List<String> activities;
  final List<String> program;
  final bool isInSummer, isForFamilies, isInWinter;

  const Trip({
    required this.id,
    required this.categories,
    required this.title,
    required this.tripType,
    required this.season,
    required this.imageUrl,
    required this.duration,
    required this.activities,
    required this.program,
    required this.isInSummer,
    required this.isForFamilies,
    required this.isInWinter,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'] as String,
      categories: List<String>.from(json['categories'] as List),
      title: json['title'] as String,
      tripType: TripType.values.firstWhere(
        (e) => e.toString().split('.').last == json['tripType'],
        orElse: () => TripType.exploration,
      ),
      season: Season.values.firstWhere(
        (e) => e.toString().split('.').last == json['season'],
        orElse: () => Season.summer,
      ),
      imageUrl: json['imageUrl'] as String,
      duration: json['duration'] as int,
      activities: List<String>.from(json['activities'] as List),
      program: List<String>.from(json['program'] as List),
      isInSummer: json['isInSummer'] as bool,
      isForFamilies: json['isForFamilies'] as bool,
      isInWinter: json['isInWinter'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categories': categories,
      'title': title,
      'tripType': tripType.toString().split('.').last,
      'season': season.toString().split('.').last,
      'imageUrl': imageUrl,
      'duration': duration,
      'activities': activities,
      'program': program,
      'isInSummer': isInSummer,
      'isForFamilies': isForFamilies,
      'isInWinter': isInWinter,
    };
  }
}
