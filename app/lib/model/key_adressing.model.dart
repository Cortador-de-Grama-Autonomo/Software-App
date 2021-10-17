import 'package:flutter/foundation.dart';

class KeyAdressing {
  final String keyType;
  final String key;

  KeyAdressing({@required this.keyType, @required this.key});

  factory KeyAdressing.fromJson(Map<String, dynamic> json) {
    return KeyAdressing(
      keyType: json['key_type'],
      key: json['key'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key_type': this.keyType,
      'key': this.key,
    };
  }
}
