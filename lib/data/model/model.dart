import 'dart:convert';

ProductModel modelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String modelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.id,
    this.maximumOrder,
    this.categoryList,
    this.productName,
    this.sku,
    this.slug,
    this.buisnessName,
    this.sellerId,
    this.sellerSlug,
    this.willShowEmi,
    this.brand,
    this.note,
    this.stock,
    this.preOrder,
    this.bookingPrice,
    this.productPrice,
    this.discountCharge,
    this.image,
    this.detailsImages,
    this.isEvent,
    this.eventId,
    this.highlight,
    this.highlightId,
    this.groupping,
    this.grouppingId,
    this.campaignSectionId,
    this.campaignSection,
    this.message,
    this.seo,
    this.metaKeyword,
    this.metaDescription,
    this.variation,
    this.bannerImage,
    this.bannerImageLink,
    this.attributeValue,
    this.iconSpecification,
    this.productReviewAvg,
  });

  int? id;
  int? maximumOrder;
  List<CategoryList>? categoryList;
  String? productName;
  String? sku;
  String? slug;
  String? buisnessName;
  int? sellerId;
  String? sellerSlug;
  bool? willShowEmi;
  Brand? brand;
  String? note;
  int? stock;
  bool? preOrder;
  int? bookingPrice;
  int? productPrice;
  dynamic? discountCharge;
  String? image;
  List<String>? detailsImages;
  bool? isEvent;
  dynamic? eventId;
  bool? highlight;
  dynamic? highlightId;
  bool? groupping;
  dynamic? grouppingId;
  dynamic? campaignSectionId;
  bool? campaignSection;
  dynamic? message;
  bool? seo;
  String? metaKeyword;
  String? metaDescription;
  dynamic? variation;
  String? bannerImage;
  String? bannerImageLink;
  dynamic? attributeValue;
  dynamic? iconSpecification;
  int? productReviewAvg;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        maximumOrder: json["maximum_order"],
        categoryList: List<CategoryList>.from(
            json["category_list"].map((x) => CategoryList.fromJson(x))),
        productName: json["product_name"],
        sku: json["sku"],
        slug: json["slug"],
        buisnessName: json["buisness_name"],
        sellerId: json["seller_id"],
        sellerSlug: json["seller_slug"],
        willShowEmi: json["will_show_emi"],
        brand: Brand.fromJson(json["brand"]),
        note: json["note"],
        stock: json["stock"],
        preOrder: json["pre_order"],
        bookingPrice: json["booking_price"],
        productPrice: json["product_price"],
        discountCharge: json["discount_charge"],
        image: json["image"],
        detailsImages: List<String>.from(json["details_images"].map((x) => x)),
        isEvent: json["is_event"],
        eventId: json["event_id"],
        highlight: json["highlight"],
        highlightId: json["highlight_id"],
        groupping: json["groupping"],
        grouppingId: json["groupping_id"],
        campaignSectionId: json["campaign_section_id"],
        campaignSection: json["campaign_section"],
        message: json["message"],
        seo: json["seo"],
        metaKeyword: json["meta_keyword"],
        metaDescription: json["meta_description"],
        variation: json["variation"],
        bannerImage: json["banner_image"],
        bannerImageLink: json["banner_image_link"],
        attributeValue: json["attribute_value"],
        iconSpecification: json["icon_specification"],
        productReviewAvg: json["product_review_avg"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "maximum_order": maximumOrder,
        "category_list":
            List<dynamic>.from(categoryList!.map((x) => x.toJson())),
        "product_name": productName,
        "sku": sku,
        "slug": slug,
        "buisness_name": buisnessName,
        "seller_id": sellerId,
        "seller_slug": sellerSlug,
        "will_show_emi": willShowEmi,
        "brand": brand!.toJson(),
        "note": note,
        "stock": stock,
        "pre_order": preOrder,
        "booking_price": bookingPrice,
        "product_price": productPrice,
        "discount_charge": discountCharge,
        "image": image,
        "details_images": List<dynamic>.from(detailsImages!.map((x) => x)),
        "is_event": isEvent,
        "event_id": eventId,
        "highlight": highlight,
        "highlight_id": highlightId,
        "groupping": groupping,
        "groupping_id": grouppingId,
        "campaign_section_id": campaignSectionId,
        "campaign_section": campaignSection,
        "message": message,
        "seo": seo,
        "meta_keyword": metaKeyword,
        "meta_description": metaDescription,
        "variation": variation,
        "banner_image": bannerImage,
        "banner_image_link": bannerImageLink,
        "attribute_value": attributeValue,
        "icon_specification": iconSpecification,
        "product_review_avg": productReviewAvg,
      };
}

class Brand {
  Brand({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  int? id;
  String? name;
  String? slug;
  String? image;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
      };
}

class CategoryList {
  CategoryList({
    this.id,
    this.categoryName,
    this.slug,
    this.isInactive,
    this.image,
    this.categoryIcon,
    this.parent,
    this.parentSlug,
  });

  int? id;
  String? categoryName;
  String? slug;
  bool? isInactive;
  String? image;
  String? categoryIcon;
  String? parent;
  String? parentSlug;

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        id: json["id"],
        categoryName: json["category_name"],
        slug: json["slug"],
        isInactive: json["is_inactive"],
        image: json["image"],
        categoryIcon: json["category_icon"],
        parent: json["parent"],
        parentSlug: json["parent_slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "slug": slug,
        "is_inactive": isInactive,
        "image": image,
        "category_icon": categoryIcon,
        "parent": parent,
        "parent_slug": parentSlug,
      };
}
