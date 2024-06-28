//
//List<Caste> casteFromJson(String str) => List<Caste>.from(json.decode(str).map((x) => Caste.fromJson(x)));
//
//String casteToJson(List<Caste> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Caste {
  String? id;
  String? caste;

  Caste({
    this.id,
    this.caste,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "caste": caste,
      };

  static Caste fromJson(Map<String, dynamic> json) => Caste(
        id: json["id"],
        caste: json["caste"],
      );
}
