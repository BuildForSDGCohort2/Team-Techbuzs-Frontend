class PlantInfo {
  String id;
  String countryName;
  // String countryCity;
  // final String

  PlantInfo({
    this.id,
    this.countryName,
    // this.countryCity,
  });

  factory PlantInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return PlantInfo(
        id: json["id"],
        // countryCity: json['city'],
        countryName: json['country']);
  }

  List<PlantInfo> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => PlantInfo.fromJson(item)).toList();
  }
}
