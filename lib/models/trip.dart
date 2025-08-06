class Trip {
  final String id,
      categories,
      title,
      tripType,
      season,
      imageUrl,
      duration,
      activities,
      program;
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
}
