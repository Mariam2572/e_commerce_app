class CategoryOrBrandsResponseEntity {
  int? results;
  List<CategoryOrBrandsEntity>? data;

  CategoryOrBrandsResponseEntity({this.results, this.data});
}

class CategoryOrBrandsEntity {
  String? id;
  String? name;
  String? slug;
  String? image;

  CategoryOrBrandsEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });
}
// for pagination

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    if (json["currentPage"] is int) {
      currentPage = json["currentPage"];
    }
    if (json["numberOfPages"] is int) {
      numberOfPages = json["numberOfPages"];
    }
    if (json["limit"] is int) {
      limit = json["limit"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["currentPage"] = currentPage;
    _data["numberOfPages"] = numberOfPages;
    _data["limit"] = limit;
    return _data;
  }
}
