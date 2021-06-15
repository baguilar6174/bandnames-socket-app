// Band Model.

class Band {
  String id;
  String name;
  int votes;

  Band({required this.id, required this.name, required this.votes});

  factory Band.fromJson(Map<String, dynamic> json) => Band(
        id: json["id"],
        name: json["name"],
        votes: json["votes"],
      );
}
