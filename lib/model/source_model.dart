class SourceModel {
  final String status;
  final List<Source> source;

  SourceModel({required this.status, required this.source});

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        status: json["status"],
        source: (json["sources"] as List).map(
          (element) {
            return Source.fromJson(element);
          },
        ).toList(),
      );
}

class Source {
  final String id;
  final String name;
  final String description;

  Source({required this.id, required this.name, required this.description});

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        description: json["description"] ?? "",
      );
}
