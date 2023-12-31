import 'dart:convert';

final class EducationModel {
  final String institution;
  final String degree;
  final String field;
  final DateTime startDate;
  final DateTime? endDate;
  final String description;
  final List<String> tags;

  const EducationModel({
    required this.institution,
    required this.degree,
    required this.field,
    required this.startDate,
    this.endDate,
    required this.description,
    required this.tags,
  });

  Map<String, dynamic> toMap() {
    return {
      'institution': institution,
      'degree': degree,
      'field': field,
      'startDate': startDate.toIso8601String(),
      if (endDate != null) ...{
        'endDate': endDate?.toIso8601String(),
      },
      'description': description,
      'tags': tags,
    };
  }

  factory EducationModel.fromMap(Map<String, dynamic> map) {
    return EducationModel(
      institution: map['institution'],
      degree: map['degree'],
      field: map['field'],
      startDate: DateTime.parse(map['startDate']),
      endDate: map['endDate'] != null ? DateTime.parse(map['endDate']) : null,
      description: map['description'],
      tags: List<String>.from(map['tags']),
    );
  }

  String toJSON() => json.encode(toMap());

  factory EducationModel.fromJSON(String source) =>
      EducationModel.fromMap(json.decode(source));

  @override
  String toString() => toJSON();
}
