import 'package:alakhbar/domin/repository/repositories/top_headline_repository.dart';

import '../entity/TopHeadLines.dart';

class TopHeadlineUseCase {
  TopHeadlineRepository topHeadlineRepository;

  TopHeadlineUseCase({required this.topHeadlineRepository});

  Future<TopHeadLinesEntity?> invoke() {
    return topHeadlineRepository.showTopHeadline();
  }
}
