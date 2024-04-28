class favourite_diet {
  final String name;
  final String image_path;
  final String descrption;
  final double rating;
  final String price;

  favourite_diet({
    required this.name,
    required this.image_path,
    required this.descrption,
    required this.rating,
    required this.price,
  });

  static get_favourite_diet() {
    List<favourite_diet> diets = [
      favourite_diet(
          name: "Cheese cake",
          image_path: "assets/images/cheesecake.jpg",
          descrption: "666666",
          rating: 4.6,
          price: "200"),
      favourite_diet(
          name: "Curry Mee",
          image_path: "assets/images/curry_mee.jpg",
          descrption: "6677",
          rating: 4.5,
          price: "200万"),
      favourite_diet(
          name: "Donut",
          image_path: "assets/images/donut.jpg",
          descrption: "666666",
          rating: 4.5,
          price: "200万"),
    ];
    return diets;
  }
}
