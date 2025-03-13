class BookModel {
  final String kind;
  final String id;
  final String etag;
  final String selfLink;
  final VolumeInfoModel volumeInfo;
  final SaleInfoModel saleInfo;
  final AccessInfoModel accessInfo;
  final SearchInfoModel? searchInfo;

  BookModel({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    required this.saleInfo,
    required this.accessInfo,
    required this.searchInfo,
  });

  factory BookModel.fromJson(Map<String, dynamic> jsonData) {
    return BookModel(
      kind: jsonData['kind'],
      id: jsonData['id'],
      etag: jsonData['etag'],
      selfLink: jsonData['selfLink'],
      volumeInfo: VolumeInfoModel.fromJson(jsonData['volumeInfo']),
      saleInfo: SaleInfoModel.fromJson(jsonData['saleInfo']),
      accessInfo: AccessInfoModel.fromJson(jsonData['accessInfo']),
      searchInfo: jsonData['searchInfo'] != null
          ? SearchInfoModel.fromJson(jsonData['searchInfo'])
          : null,
    );
  }
}

class VolumeInfoModel {
  final String title;
  final List<String> authors;
  final String publisher;
  final String publishedDate;
  final String description;
  final List<IndustryIdentifierModel> industryIdentifiers;
  final int pageCount;
  final String printType;
  final List<String> categories;
  final double averageRating;
  final int ratingsCount;
  final String maturityRating;
  final bool allowAnonLogging;
  final ImageLinksModel? imageLinks;
  final String language;
  final String previewLink;
  final String infoLink;
  final String canonicalVolumeLink;

  VolumeInfoModel({
    required this.title,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.industryIdentifiers,
    required this.pageCount,
    required this.printType,
    required this.categories,
    required this.averageRating,
    required this.ratingsCount,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
  });

  factory VolumeInfoModel.fromJson(Map<String, dynamic> json) {
    return VolumeInfoModel(
      title: json['title'],
      authors: List<String>.from(json['authors'] ?? []),
      publisher: json['publisher'] ?? '',
      publishedDate: json['publishedDate'] ?? '',
      description: json['description'] ?? '',
      industryIdentifiers: (json['industryIdentifiers'] as List?)?.map((e) => IndustryIdentifierModel.fromJson(e)).toList() ?? [],
      pageCount: json['pageCount'] ?? 0,
      printType: json['printType'] ?? '',
      categories: List<String>.from(json['categories'] ?? []),
      averageRating: (json['averageRating'] is num)
          ? (json['averageRating'] as num).toDouble()
          : 0.0, // Ensuring it's always a double
      ratingsCount: (json['ratingsCount'] is num)
          ? (json['ratingsCount'] as num).toInt()
          : 0, // Ensuring it's always an int
      maturityRating: json['maturityRating'] ?? '',
      allowAnonLogging: json['allowAnonLogging'] ?? false,
      imageLinks: json['imageLinks'] != null ? ImageLinksModel.fromJson(json['imageLinks']) : null,
      language: json['language'] ?? '',
      previewLink: json['previewLink'] ?? '',
      infoLink: json['infoLink'] ?? '',
      canonicalVolumeLink: json['canonicalVolumeLink'] ?? '',
    );
  }
}

class IndustryIdentifierModel {
  final String type;
  final String identifier;

  IndustryIdentifierModel({required this.type, required this.identifier});

  factory IndustryIdentifierModel.fromJson(Map<String, dynamic> json) {
    return IndustryIdentifierModel(
      type: json['type'],
      identifier: json['identifier'],
    );
  }
}

class ImageLinksModel {
  final String smallThumbnail;
  final String thumbnail;

  ImageLinksModel({required this.smallThumbnail, required this.thumbnail});

  factory ImageLinksModel.fromJson(Map<String, dynamic> json) {
    return ImageLinksModel(
      smallThumbnail: json['smallThumbnail'],
      thumbnail: json['thumbnail'],
    );
  }
}

class SaleInfoModel {
  final String country;
  final String saleability;
  final bool isEbook;
  final PriceModel? retailPrice;
  final PriceModel? listPrice;

  SaleInfoModel({
    required this.country,
    required this.saleability,
    required this.isEbook,
    this.retailPrice,
    this.listPrice,
  });

  factory SaleInfoModel.fromJson(Map<String, dynamic> json) {
    return SaleInfoModel(
      country: json['country'],
      saleability: json['saleability'],
      isEbook: json['isEbook'],
      retailPrice: json['retailPrice'] != null ? PriceModel.fromJson(json['retailPrice']) : null,
      listPrice: json['listPrice'] != null ? PriceModel.fromJson(json['listPrice']) : null,
    );
  }
}

class PriceModel {
  final double amount;
  final String currencyCode;

  PriceModel({required this.amount, required this.currencyCode});

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      currencyCode: json['currencyCode'] ?? '',
    );
  }
}



class AccessInfoModel {
  final String country;
  final String viewability;
  final bool embeddable;
  final bool publicDomain;
  final bool quoteSharingAllowed;
  final PdfModel? pdf;

  AccessInfoModel({
    required this.country,
    required this.viewability,
    required this.embeddable,
    required this.publicDomain,
    required this.quoteSharingAllowed,
    required this.pdf,
  });

  factory AccessInfoModel.fromJson(Map<String, dynamic> json) {
    return AccessInfoModel(
      country: json['country'],
      viewability: json['viewability'],
      embeddable: json['embeddable'],
      publicDomain: json['publicDomain'],
      quoteSharingAllowed: json['quoteSharingAllowed'],
      pdf: json['pdf'] != null ? PdfModel.fromJson(json['pdf']) : null,
    );
  }
}

class PdfModel {
  final bool isAvailable;
  final String? acsTokenLink;

  PdfModel({required this.isAvailable, this.acsTokenLink});

  factory PdfModel.fromJson(Map<String, dynamic> json) {
    return PdfModel(
      isAvailable: json['isAvailable'],
      acsTokenLink: json['acsTokenLink'],
    );
  }
}

class SearchInfoModel {
  final String textSnippet;

  SearchInfoModel({required this.textSnippet});

  factory SearchInfoModel.fromJson(Map<String, dynamic> json) {
    return SearchInfoModel(
      textSnippet: json['textSnippet'],
    );
  }
}
