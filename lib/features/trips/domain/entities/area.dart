import 'package:equatable/equatable.dart';

class Area extends Equatable {
  final String id;
  final String name;
  final String description;
  final List<String> country;
  final String imageUrl;

  const Area({
    required this.id,
    required this.name,
    required this.description,
    required this.country,
    required this.imageUrl,
  });

  factory Area.empty() {
    return const Area(
      id: 'empty_id',
      name: 'empty_name',
      description: 'empty_description',
      country: ['empty_country'],
      imageUrl: 'empty_imageUrl',
    );
  }

  @override
  List<Object?> get props => [id, name, description, country, imageUrl];
}
