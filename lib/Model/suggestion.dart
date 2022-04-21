class Suggestion {
  String? title;
  String? type;
  int? price;
  int? id;
  int? dose;
  final bool prescription;
  String? image;

  Suggestion(
      {this.price,
        this.id,
      this.title,
      this.type,
      this.dose,
      required this.prescription,
      this.image});
}
