import 'package:alakhbar/ui/home/details_screen/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreenViewModel extends Cubit<DetailsScreenStates> {
  DetailsScreenViewModel() : super(DetailsScreenInitialState());

  void moreDetails(String articleUrl) async {
    final Uri url = Uri.parse(articleUrl);
    try {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      print(e);
    }
  }
}
