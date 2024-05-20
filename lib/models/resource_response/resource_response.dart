import 'dart:convert';

import 'source.dart';

class SourceResponse {
  String? status;
  List<Source>? sources;
  String? code;
  String? message;
  SourceResponse({this.status, this.sources, this.code, this.message});

  factory SourceResponse.fromMap(Map<String, dynamic> data) {
    return SourceResponse(
      code: data['code'] as String?,
      message: data['message'] as String?,
      status: data['status'] as String?,
      sources: (data['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'sources': sources?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SourceResponse].
  factory SourceResponse.fromJson(String data) {
    return SourceResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SourceResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
