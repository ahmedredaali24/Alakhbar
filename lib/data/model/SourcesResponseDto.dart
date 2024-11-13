import 'package:alakhbar/data/model/top_headline_response_dto.dart';
import 'package:alakhbar/domin/entity/SourcesResponseEntity.dart';

class SourcesResponseDto extends SourcesResponseEntity {
  SourcesResponseDto({
    super.status,
    super.sources,
  });

  SourcesResponseDto.fromJson(dynamic json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Sources.fromJson(v));
      });
    }
  }
}

class Sources extends SourcesEntity {
  Sources({
    super.id,
    super.name,
    super.description,
    super.url,
    super.category,
    super.language,
    super.country,
  });

  Sources.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }
}
