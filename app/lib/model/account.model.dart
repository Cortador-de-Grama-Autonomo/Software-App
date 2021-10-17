class AccountModel {
  final int branch;
  final int number;
  final String description;
  final int situationId;
  final String situation;
  final String accountNumber;
  final String branchCode;
  final int clientZoneCod;
  final int ownershipCod;
  final String ownershipDs;
  final int accountTypeCod;
  final int personId;

  AccountModel({
    this.branch,
    this.number,
    this.description,
    this.situationId,
    this.situation,
    this.accountNumber,
    this.branchCode,
    this.clientZoneCod,
    this.ownershipCod,
    this.ownershipDs,
    this.accountTypeCod,
    this.personId,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      branch: json['branch'],
      number: json['number'],
      description: json['description'],
      situationId: json['situation_id'],
      situation: json['situation'],
      accountNumber: json['account_number'],
      branchCode: json['branch_code'],
      clientZoneCod: json['client_zone_cod'],
      ownershipCod: json['ownership_cod'],
      ownershipDs: json['ownership_ds'],
      accountTypeCod: json['account_type_cod'],
      personId: json['person_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "branch": this.branch,
      "number": this.number,
      "description": this.description,
      "situation_id": this.situationId,
      "situation": this.situation,
      "account_number": this.accountNumber,
      "branch_code": this.branchCode,
      "client_zone_cod": this.clientZoneCod,
      "ownership_cod": this.ownershipCod,
      "ownership_ds": this.ownershipDs,
      "account_type_cod": this.accountTypeCod,
      "person_id": this.personId,
    };
  }
}
