class ProductModel {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final Rating? rating;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.rating,
  });

  /// JSON → Object
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
    );
  }

  /// Object → JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      if (rating != null) 'rating': rating!.toJson(),
    };
  }
}

class Rating {
  final num rate;
  final num count;

  const Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }
}

// ProductModel ক্লাস
//
// ফিল্ডস 👉 id, title, price, description, category, image, এবং rating (অপশনাল)।
//
// fromJson() 👉 JSON ডেটাকে ProductModel অবজেক্টে রূপান্তর করে।
//
// toJson() 👉 অবজেক্টকে JSON ফরম্যাটে রূপান্তর করে।
//
// 🔹 Rating ক্লাস
//
// ফিল্ডস 👉 rate (রেটিং স্কোর) এবং count (কতজন রেট দিয়েছে)।
//
// fromJson() 👉 JSON থেকে Rating অবজেক্ট তৈরি করে।
//
// toJson() 👉 Rating অবজেক্টকে JSON এ রূপান্তর করে।