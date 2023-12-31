import 'dart:convert';

final class EducationModel {
  final String institution;
  final String degree;
  final String field;
  final DateTime startDate;
  final DateTime? endDate;

  const EducationModel({
    required this.institution,
    required this.degree,
    required this.field,
    required this.startDate,
    this.endDate,
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
    };
  }

  factory EducationModel.fromMap(Map<String, dynamic> map) {
    return EducationModel(
      institution: map['institution'],
      degree: map['degree'],
      field: map['field'],
      startDate: DateTime.parse(map['startDate']),
      endDate: map['endDate'] != null ? DateTime.parse(map['endDate']) : null,
    );
  }

  String toJSON() => json.encode(toMap());

  factory EducationModel.fromJSON(String source) =>
      EducationModel.fromMap(json.decode(source));

  @override
  String toString() => toJSON();
}
