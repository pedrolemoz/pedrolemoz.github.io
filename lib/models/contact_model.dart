import 'dart:convert';

final class ContactModel {
  final String name;
  final String url;

  const ContactModel({required this.name, required this.url});

  Map<String, dynamic> toMap() => {'name': name, 'url': url};

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJSON() => json.encode(toMap());

  factory ContactModel.fromJSON(String source) =>
      ContactModel.fromMap(json.decode(source));

  @override
  String toString() => toJSON();
}
