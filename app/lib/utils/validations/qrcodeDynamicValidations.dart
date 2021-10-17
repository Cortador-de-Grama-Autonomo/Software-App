import 'package:form_validator/form_validator.dart';
import 'package:cpfcnpj/cpfcnpj.dart';

extension CustomValidationBuilder on ValidationBuilder {
  cpf() => add((value) {
        if (CPF.isValid(value)) {
          return null;
        }
        return "Documento inválido";
      });

  cnpj() => add((value) {
        if (CNPJ.isValid(value)) {
          return null;
        }
        return "Documento inválido";
      });
}

class QrCodeFormValidations {
  static final TitleValidation = ValidationBuilder()
      .minLength(3, "Este campo precisa ser de no mínimo 3 caracteres")
      .maxLength(50, "Este campo precisa ser de no máximo 50 caracteres")
      .required()
      .build();
  static final PayerNameValidation = ValidationBuilder()
      .minLength(3, "Este campo precisa ser de no mínimo 3 caracteres")
      .maxLength(50, "Este campo precisa ser de no máximo 50 caracteres")
      .required()
      .build();
  static final InterestValidation = ValidationBuilder()
      .minLength(3, "Este campo precisa ser de no mínimo 3 caracteres")
      .required()
      .build();
  static final FineValidation = ValidationBuilder()
      .minLength(3, "Este campo precisa ser de no mínimo 3 caracteres")
      .required()
      .build();
  static final DiscountValidation = ValidationBuilder()
      .minLength(3, "Este campo precisa ser de no mínimo 3 caracteres")
      .required()
      .build();
  static final DocumentValidation = ValidationBuilder()
      .required()
      .or((builder) => builder.cpf(), (builder) => builder.cnpj())
      .build();
}
