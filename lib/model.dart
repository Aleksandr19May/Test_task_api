class Info {
  final String city;
  final int offerID;
  final String name;
  final String statusName;
  final String paymentStatus;

  const Info({
    required this.name,
    required this.statusName,
    required this.city,
    required this.offerID,
    required this.paymentStatus,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        name: json["OFFER_FIRST_RESPONSIBLE"],
        city: json["CITY_NAME"],
        offerID: json["OFFER_FIRST_RESPONSIBLE_ID"],
        statusName: json["STATUS_NAME"],
        paymentStatus: json["PAYMENT_STATUS"],
      );
}
