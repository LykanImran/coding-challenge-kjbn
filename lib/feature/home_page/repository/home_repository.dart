import 'package:coding_challenge_kjbn/feature/home_page/model/home_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository {
  HomeRepository._();
  static Future<void> saveData(HomeModel home) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('second', home.second!);
    await prefs.setInt('random', home.randomNum!);
    await prefs.setString('msgTitle', home.msgTitle!);
    await prefs.setString('msgSub', home.msgSub!);
    await prefs.setInt('success', home.success!);
    await prefs.setInt('attempts', home.attempts!);
  }

  static Future<HomeModel> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    HomeModel home = HomeModel();
    home.second = prefs.getInt('second') ?? 0;
    home.randomNum = prefs.getInt('random') ?? 0;
    home.msgTitle = prefs.getString('msgTitle') ?? '';
    home.msgSub = prefs.getString('msgSub') ?? '';
    home.success = prefs.getInt('success') ?? 0;
    home.attempts = prefs.getInt('attempts') ?? 0;

    return home;
  }
}
