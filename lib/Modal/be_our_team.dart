//
//List<Caste> casteFromJson(String str) => List<Caste>.from(json.decode(str).map((x) => Caste.fromJson(x)));
//
//String casteToJson(List<Caste> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Team {
  String? name;
  String? address;
  String? idcard;
  String? city;
  String? phno;
  String? profession;

  Team({
    this.name,
    this.address,
    this.idcard,
    this.city,
    this.phno,
    this.profession,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        'idcard': idcard,
        'city': city,
        'phno': phno,
        'profession': profession,
      };

  static Team fromJson(Map<String, dynamic> json) => Team(
        name: json["name"],
        address: json["address"],
        idcard: json["idcard"],
        city: json["city"],
        phno: json["phno"],
        profession: json["profession"],
      );
}
