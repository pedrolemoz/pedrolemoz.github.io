import 'dart:convert';

import 'contact_model.dart';
import 'education_model.dart';
import 'experience_model.dart';

final class PersonDataModel {
  final String firstName;
  final String lastName;
  final String bio;
  final String shortDescription;
  final String fullDescription;
  final List<ContactModel> contacts;
  final List<EducationModel> education;
  final List<ExperienceModel> experiences;

  const PersonDataModel({
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.shortDescription,
    required this.fullDescription,
    required this.contacts,
    required this.education,
    required this.experiences,
  });

  String get fullName => '$firstName $lastName';

  Map<String, dynamic> toMap() {
    return {
      'information': {
        'firstName': firstName,
        'lastName': lastName,
        'bio': bio,
        'shortDescription': shortDescription,
        'fullDescription': fullDescription,
        'contacts': contacts.map((contact) => contact.toMap()).toList(),
      },
      'education': education.map((education) => education.toMap()).toList(),
      'experiences':
          experiences.map((experience) => experience.toMap()).toList(),
    };
  }

  factory PersonDataModel.fromMap(Map<String, dynamic> map) {
    return PersonDataModel(
      firstName: map['information']['firstName'],
      lastName: map['information']['lastName'],
      bio: map['information']['bio'],
      shortDescription: map['information']['shortDescription'],
      fullDescription: map['information']['fullDescription'],
      contacts: List<ContactModel>.from(
        map['information']['contacts']?.map(
          (contact) => ContactModel.fromMap(contact),
        ),
      ),
      education: List<EducationModel>.from(
        map['education']?.map(
          (education) => EducationModel.fromMap(education),
        ),
      ),
      experiences: List<ExperienceModel>.from(
        map['experiences']?.map(
          (experience) => ExperienceModel.fromMap(experience),
        ),
      ),
    );
  }

  String toJSON() => json.encode(toMap());

  factory PersonDataModel.fromJSON(String source) =>
      PersonDataModel.fromMap(json.decode(source));

  @override
  String toString() => toJSON();
}
