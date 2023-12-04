class Car {
  final int carId;
  final int color;
  final String title;
  final int yearOfIssue;
  final String subtitle;
  final double volume;
  final int mileage;
  final String location;
  final List<String> images;

  Car({
    required this.carId,
    required this.color,
    required this.title,
    required this.yearOfIssue,
    required this.subtitle,
    required this.volume,
    required this.mileage,
    required this.location,
    required this.images,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      carId: json['carId'] ?? '0',
      color: json['color'] ?? '0xFFFFFFFF',
      title: json['title'] ?? '',
      yearOfIssue: json['yearOfIssue'] ?? 0,
      subtitle: json['subtitle'] ?? '',
      volume: json['volume'] ?? 0.0,
      mileage: json['mileage'] ?? 0,
      location: json['location'] ?? '',
      images: List<String>.from(json['images'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'yearOfIssue': yearOfIssue,
      'subtitle': subtitle,
      'volume': volume,
      'mileage': mileage,
      'location': location,
      'images': images,
    };
  }
}
