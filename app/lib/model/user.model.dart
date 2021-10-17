class UserModel {
  final int code;
  final String clientType;
  final String cpf;
  final String cpfChecDigit;
  final String cnpj;
  final String cnpjCheckDigit;
  final String pfName;
  final String fantasyName;
  final String pjName;
  final String clientTotalRiskValue;
  final String economicRiskGroupValue;
  final String totalIcomeValue;
  final String companySize;
  final String clientTypeClassification;
  final String accountingActivity;
  final String takerRiskClassification;
  final String clientSituation;
  final String identityNumber;
  final String dispatcherOrgan;
  final String birthdayDate;
  final String nationality;

  UserModel({
    this.code,
    this.clientType,
    this.cpf,
    this.cpfChecDigit,
    this.cnpj,
    this.cnpjCheckDigit,
    this.pfName,
    this.fantasyName,
    this.pjName,
    this.clientTotalRiskValue,
    this.economicRiskGroupValue,
    this.totalIcomeValue,
    this.companySize,
    this.clientTypeClassification,
    this.accountingActivity,
    this.takerRiskClassification,
    this.clientSituation,
    this.identityNumber,
    this.dispatcherOrgan,
    this.birthdayDate,
    this.nationality,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      code: json['code'],
      clientType: json['client_type'],
      cpf: json['cpf'],
      cpfChecDigit: json['cpf_check_digit'],
      cnpj: json['cnpj'],
      cnpjCheckDigit: json['cnpj_check_digit'],
      pfName: json['pf_name'],
      fantasyName: json['fantasy_name'],
      pjName: json['pj_name'],
      clientTotalRiskValue: json['client_total_risk_value'],
      economicRiskGroupValue: json['economic_risk_group_value'],
      totalIcomeValue: json['total_icome_value'],
      companySize: json['company_size'],
      clientTypeClassification: json['client_type_classification'],
      accountingActivity: json['accounting_activity'],
      takerRiskClassification: json['taker_risk_classification'],
      clientSituation: json['client_situation'],
      identityNumber: json['identity_number'],
      dispatcherOrgan: json['dispatcher_organ'],
      birthdayDate: json['birthday_date'],
      nationality: json['nationality'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "code": this.code,
      "client_type": this.clientType,
      "cpf": this.cpf,
      "cpf_check_digit": this.cpfChecDigit,
      "cnpj": this.cnpj,
      "cnpj_check_digit": this.cnpjCheckDigit,
      "pf_name": this.pfName,
      "fantasy_name": this.fantasyName,
      "pj_name": this.pjName,
      "client_total_risk_value": this.clientTotalRiskValue,
      "economic_risk_group_value": this.economicRiskGroupValue,
      "total_icome_value": this.totalIcomeValue,
      "company_size": this.companySize,
      "client_type_classification": this.clientTypeClassification,
      "accounting_activity": this.accountingActivity,
      "taker_risk_classification": this.takerRiskClassification,
      "client_situation": this.clientSituation,
      "identity_number": this.identityNumber,
      "dispatcher_organ": this.dispatcherOrgan,
      "birthday_date": this.birthdayDate,
      "nationality": this.nationality,
    };
  }
}
