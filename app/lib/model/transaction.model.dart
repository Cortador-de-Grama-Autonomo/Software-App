class TransactionModel {
  final double price;
  final String data;
  final String personName;
  final String personAgency;
  final String personAccount;
  final String payerMethod;
  final String liquidationDate;
  final String receiverConciliationId;
  final String accountId;
  final bool entry;
  final String bankName;

  TransactionModel({
    this.price,
    this.data,
    this.personName,
    this.personAccount,
    this.payerMethod,
    this.personAgency,
    this.liquidationDate,
    this.receiverConciliationId,
    this.accountId,
    this.entry,
    this.bankName,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      price: double.parse(json['price'].toString()),
      data: json['data'],
      personName: json['person_name'],
      personAccount: json['person_account'],
      liquidationDate: json['liquidation_date'],
      receiverConciliationId: json['receiver_conciliation_id'],
      accountId: json['account_id'].toString(),
      entry: json['entry'],
      bankName: json['bank_name'],
      personAgency: json['person_agency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "price": this.price,
      "data": this.data,
      "person_name": this.personName,
      "person_account": this.personAccount,
      "liquidation_date": this.liquidationDate,
      "receiver_conciliation_id": this.receiverConciliationId,
      "account_id": this.accountId,
      "entry": this.entry,
      "bank_name": this.bankName,
      "person_agency": this.personAgency,
    };
  }
}
