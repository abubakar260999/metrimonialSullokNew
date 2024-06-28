//List<Profession> casteFromJson(String str) => List<Profession>.from(json.decode(str).map((x) => Profession.fromJson(x)));
//
//String casteToJson(List<Profession> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Profession {
  String? id;
  String? profession;

  Profession({
    this.id,
    this.profession,
  });

  factory Profession.fromJson(Map<String, dynamic> json) => Profession(
        id: json["id"],
        profession: json["profession"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "profession": profession,
      };
}
