import 'package:http/http.dart' as http;

class HomeService {
  Future<http.Response> getProducts() async {
    String url = "https://fakestoreapi.com/products";

    http.Response response = await http.get(Uri.parse(url));
    return response;
  }

  Future<http.Response> getCategories() async {
    String url = "https://fakestoreapi.com/products/categories";
    http.Response response = await http.get(Uri.parse(url));
    return response;
  }

  Future<http.Response> getProductsByCategory(String category) async {
    String url = "https://fakestoreapi.com/products/category/${category}";
    http.Response response = await http.get(Uri.parse(url));
    return response;
  }
}

//🔹 মূল কাজ
//
//HomeService হলো একটা সার্ভিস ক্লাস যেটা API থেকে ডেটা আনার কাজ করে (HTTP Request পাঠায় এবং Response রিটার্ন করে)।
//
//🔹 এর ভিতরে মেথডগুলো
//
//getProducts()
//
//কাজ: সব প্রোডাক্টের লিস্ট API থেকে নিয়ে আসে।
//
//URL: https://fakestoreapi.com/products
//
//রিটার্ন করে: http.Response
//
//getCategories()
//
//কাজ: প্রোডাক্টগুলোর সব ক্যাটাগরির নাম নিয়ে আসে।
//
//URL: https://fakestoreapi.com/products/categories
//
//রিটার্ন করে: http.Response
//
//getProductsByCategory(String category)
//
//কাজ: নির্দিষ্ট ক্যাটাগরির সব প্রোডাক্ট আনে।
//
//URL: https://fakestoreapi.com/products/category/{category}
//
//রিটার্ন করে: http.Response