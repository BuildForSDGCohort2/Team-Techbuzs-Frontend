class Activity {
  String imageUrl;
  String name;
  String type;
  List<String> startTimes;
  int rating;
  int price;

  Activity({
    this.imageUrl,
    this.name,
    this.type,
    this.startTimes,
    this.rating,
    this.price,
  });
}

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;

  Destination({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
  });
}

List<Destination> destinations = [
  Destination(
    imageUrl: 'https://techbuzs.github.io/OTP/North.jpg',
    city: 'North America',
    country: 'North America',
  ),
  Destination(
    imageUrl: 'https://techbuzs.github.io/OTP/Latin.jpg',
    city: 'Latin America',
    country: 'Latin America',
  ),
  Destination(
    imageUrl: 'https://techbuzs.github.io/OTP/Asia.jpg',
    city: 'Asia',
    country: 'Asia',
  ),
  Destination(
    imageUrl: 'https://techbuzs.github.io/OTP/Europe.png',
    city: 'Europe',
    country: 'Europe',
  ),
  Destination(
    imageUrl: 'https://techbuzs.github.io/OTP/pacific.jpg',
    city: 'The Pacific',
    country: 'The Pacific',
  ),
  Destination(
    imageUrl: 'https://techbuzs.github.io/OTP/Africa.jpg',
    city: 'Africa ',
    country: 'Africa',
  ),
  Destination(
    imageUrl: 'https://techbuzs.github.io/OTP/USDA.jpg',
    city: 'USFS ',
    country: 'Pacific Northwest Region - National Forests',
  ),
];
