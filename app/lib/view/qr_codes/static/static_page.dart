import 'dart:convert';
import 'package:app/controller/static_qrcode.controller.dart';
import 'package:app/model/static_qrcode.model.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/services/api.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/widgets/general_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StaticQrCodePage extends StatefulWidget {
  StaticQrCodePage({Key key}) : super(key: key);

  @override
  _StaticQrCodePageState createState() {
    return _StaticQrCodePageState();
  }
}

class _StaticQrCodePageState extends State<StaticQrCodePage> {
  final api = new Api();
  List<StaticQrCodeModel> qrCodeList = [];
  ScrollController _scrollController = ScrollController();
  int _page = 1;
  bool canScroll = true;

  @override
  initState() {
    super.initState();
    getStaticQrCodeList();
    _scrollController.addListener(() {
      if (canScroll &&
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        getStaticQrCodeList(isScroll: true);
      }
    });
  }

  Future<void> updateOnPullRefresh() async {
    getStaticQrCodeList();
  }

  List<StaticQrCodeModel> formatQrCodeListFromServer(qrCodeJsonList) {
    List<StaticQrCodeModel> qrCodeFormattedList = [];
    for (var qrCodeJson in qrCodeJsonList) {
      var qrCodeFormatted = StaticQrCodeModel.fromJson(qrCodeJson);
      qrCodeFormattedList.add(qrCodeFormatted);
    }
    return qrCodeFormattedList;
  }

  void getStaticQrCodeList({isScroll = false}) async {
    const userId = 1;
    try {
      setState(() {
        if (isScroll) {
          _page = _page + 1;
        } else {
          _page = 1;
        }
      });
      final response = await api.get(
          route:
              '/static-qrcode/get-all/' + userId.toString() + "?page=$_page");

      final body = jsonDecode(response.body);

      final qrCodeFormatted = formatQrCodeListFromServer(body['response']);

      this.setState(() {
        if (isScroll) {
          qrCodeList = [...qrCodeList, ...qrCodeFormatted];
        } else {
          qrCodeList = qrCodeFormatted;
        }

        if (qrCodeFormatted.length == 0) {
          canScroll = false;
        }
      });
    } catch (e) {
      throw Exception('Failed to get QrCode List From Server');
    }
  }

  Positioned renderAddQrCodeButton(BuildContext context) {
    return Positioned(
      bottom: 30,
      right: 10,
      child: FloatingActionButton(
        backgroundColor: Color(0xff003E7E),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.GENERATE_QR_CODE,
              arguments: getStaticQrCodeList);
        },
      ),
    );
  }

  ListView renderQrcodeList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: qrCodeList.length,
      itemBuilder: (BuildContext context, int index) {
        final qrCodeData = {
          'title': qrCodeList[index].title,
          'subtitle': qrCodeList[index].price,
          'id': qrCodeList[index].id
        };
        return GeneralTile(
          elementData: qrCodeData,
          elementObj: qrCodeList[index],
          actionsList: StaticQrcodeController().getQrCodeRoutesList(),
          callback: getStaticQrCodeList,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    var refreshIndicatorChild;
    if (qrCodeList.length != 0) {
      refreshIndicatorChild = renderQrcodeList();
    } else if (qrCodeList.length == 0) {
      refreshIndicatorChild = Text(
        'Você não possui nenhum QrCode.',
        style: Theme.of(context).textTheme.headline2,
      );
    } else {
      refreshIndicatorChild = Text(
        'Carregando...',
        style: Theme.of(context).textTheme.headline2,
      );
    }

    body = RefreshIndicator(
      onRefresh: updateOnPullRefresh,
      child: refreshIndicatorChild,
    );

    return Stack(
      children: [
        BaseScreen(
          topTitle: "QR Codes",
          bottomTitle: "Estático",
          body: body,
        ),
        renderAddQrCodeButton(context)
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
