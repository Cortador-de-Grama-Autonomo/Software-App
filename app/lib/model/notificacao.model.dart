class NotificacaoModel {
  final double titulo;
  final String mensagem;
  final String data;


  NotificacaoModel({
    this.titulo,
    this.mensagem,
    this.data,
  });

  factory NotificacaoModel.fromJson(Map<String, dynamic> json) {
    return NotificacaoModel(
      titulo: double.parse(json['titulo'].toString()),
      mensagem: json['mensagem'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "titulo": this.titulo,
      "mensagem": this.mensagem,
      "data": this.data,
    };
  }
}
