//List<Education> educationFromJson(String str) => List<Education>.from(json.decode(str).map((x) => Education.fromJson(x)));
//
//String educationToJson(List<Education> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Education {
  String? id;
  String? education;

  Education({
    this.id,
    this.education,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json["id"],
        education: json["education"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "education": education,
      };
}
