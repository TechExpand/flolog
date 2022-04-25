class Suggestion {
  String? title;
  String? type;
  String? price;
  int? id;
  int? dose;
   bool? prescription;
  String? image;



  String? category;
  String? name;
  String? brand;
  String? productClass;
  String? label;
  String? dosageForm;
  String? description;
  String? strength;
  String?  expiryDate;
  String?  distributor;
  String?  rating;
  int?  numReviews;
  int?  countInStock;
  String? discount_price;
  String? dateCreated;
  int? user;

  Suggestion(
      {this.price,
        this.id,
      this.title,
        this.image,
        this.name,
        this.user,
        this.dose,
        this.type,
        this.category,
        this.label,
        this.brand,
        this.dateCreated,
        this.discount_price,
        this.countInStock,
        this.distributor,
        this.expiryDate,
        this.numReviews,
        this.productClass,
        this.rating,
        this.strength,
        this.description,
        this.dosageForm,
       this.prescription,
      });



  static Suggestion fromJson(Map<String, dynamic> json) => Suggestion(
    // prescription: json['prescription'],
    dosageForm: json['dosageForm'],
    description: json['description'],
    strength: json['strength'],
    rating: json['rating'],
    productClass: json['productClass'],
    numReviews: json['numReviews'],
    expiryDate: json['expiryDate'],
    distributor: json['distributor'],
    countInStock: json['countInStock'],
    // user: json['user'] != null ?  UserSearch.fromJson(json['user']) : null,
    discount_price: json['discount_price'],
    dateCreated: json['dateCreated'],
    category: json['category'],
    brand: json['brand'],
    name: json['name'],
    label: json['label'],
    image: json['image'],
    title: json['title'],
    id: json['id'],
    price: json['price'],

  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "name": name,
    "brand": brand,
    "productClass": productClass,
    "image":  image,
    "label": label,
    "dosageForm": "dosageForm",
    "description": description,
    "strength": strength,
    "expiryDate": expiryDate,
    "distributor": distributor,
    "rating": rating,
    "numReviews": numReviews,
    "price": price,
    "id": id,
    "countInStock": countInStock,
    "discount_price": discount_price,
    "dateCreated": dateCreated,
    "user": user,
  };
}
