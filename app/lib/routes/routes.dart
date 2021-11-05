import 'package:app/view/adressing_key/dispositivos_conectados.dart';
import 'package:app/view/adressing_key/generate_adressing_key.dart';
import 'package:app/view/home/home_page.dart';
import 'package:app/view/home/notificacao.dart';
import 'package:app/view/payment/add_area.dart';
import 'package:app/view/payment/addressing/addressing_payment.dart';
import 'package:app/view/payment/confirm_payment/payment.dart';
import 'package:app/view/payment/mapa.dart';
import 'package:app/view/payment/payment_page.dart';
import 'package:app/view/qr_codes/qr_codes.dart';
import 'package:app/view/qr_codes/static/agendamento.dart';
import 'package:app/view/qr_codes/static/configuracoes.dart';
import 'package:app/view/qr_codes/static/corte.dart';
import 'package:app/view/qr_codes/static/generate_qr.dart';
import 'package:app/view/qr_codes/static/static_page.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/widgets/splash_screen.dart';
import 'package:app/widgets/error_screen.dart';
import 'package:app/widgets/success_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:app/view/login/login_page.dart';
import 'package:app/view/payment/payment_manual/payment_manual.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.HOME_PAGE: (tcx) => HomePage(),
    // AppRoutes.PAYMENT_PAGE: (tcx) => PaymentPage(),
    AppRoutes.QR_CODE_PAGE: (tcx) => QRCodePage(),
    AppRoutes.SUCCESS_SCREEN: (tcx) => SuccesScreen(),
    AppRoutes.ERROR_SCREEN: (tcx) => ErrorScreen(),
    AppRoutes.GENERATE_QR_CODE: (tcx) => QRCodeReader(),
    AppRoutes.SPLASH_PAGE: (tcx) => Splash(),
    AppRoutes.LOGIN_PAGE: (tcx) => Login(),
    AppRoutes.ADRESSING_KEY: (tcx) => AdressingKeyPage(),
    AppRoutes.GENERATE_ADRESSING_KEY: (tcx) => GenerateAdressingKey(),
    // AppRoutes.CONFIRM_PAYMENT: (tcx) => Payment(),
    AppRoutes.PAYMENT_MANUAL: (tcx) => PaymentManual(),
    // AppRoutes.ADRESSING_PAYMENT: (tcx) => AddressingPayment(),
    AppRoutes.NOTIFICACAO: (tcx) => Notificacao(),
    AppRoutes.CONFIG: (tcx) => Configuracao(),
    AppRoutes.CORTE: (tcx) => Corte(),
    AppRoutes.AGENDAR: (tcx) => Agendar(),
    AppRoutes.MAPA: (tcx) => Mapa(),
    AppRoutes.ADD_AREA: (tcx) => AddArea(),




  
  };
}
