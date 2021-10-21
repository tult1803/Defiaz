import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helpers/color.dart';
import 'helpers/colors.dart';

enum AppThemeKeys { light, dark }

final Map<AppThemeKeys, ThemeData> _themes = {
  AppThemeKeys.light: ThemeData(
    // primaryColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        color: Colors.white,
        actionsIconTheme: IconThemeData(color: Colors.black54)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.black54,
      backgroundColor: Colors.white,
      selectedIconTheme: IconThemeData(color: Colors.black54),
    ),
    // canvasColor
  ),
  AppThemeKeys.dark: ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
        color: colorHexa("303030"),
        actionsIconTheme: const IconThemeData(color: Colors.white)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      backgroundColor: colorHexa("303030"),
      selectedIconTheme: const IconThemeData(color: Colors.white),
    ),
  ),
};

class AppTheme extends ChangeNotifier {
  static AppTheme of(BuildContext context, {bool listen = false}) =>
      Provider.of<AppTheme>(context, listen: listen);

  AppThemeKeys _themeKey = AppThemeKeys.light;

  ThemeData? get currentTheme => _themes[_themeKey];

  AppThemeKeys get currentThemeKey => _themeKey;

  setTheme(AppThemeKeys themeKey) {
    _themeKey = themeKey;
    notifyListeners();
  }

  switchTheme() async {
    if (_themeKey == AppThemeKeys.dark) {
      _themeKey = AppThemeKeys.light;
      unselectedLabelColor = Colors.black54;
      labelColor = colorHexa("141414");
      indicatorColor = colorHexa("7cc618");
      colorContainerTitle = colorHexa("141414");
      colorSizeBoxTitle = Colors.black26;
      colorContainerPriceCoins = Colors.black87;
      // selectedItemColor = Colors.black87;
      colorContainerHotNews = colorHexa("212121");
      colorIconSearch = Colors.black54;
      colorTitleContainerSpecialForYou = colorHexa("575757");
      colorContentContainerSpecialForYou = colorHexa("141414");
      colorImageContainerSpecialForYou = Colors.black87;
      colorContainerFavorite = colorHexa("212121");
      colorSizeBoxFavorite = Colors.black54;
      colorTitleComponentBottomProfile = colorHexa("141414");
      colorComponentBottomProfile = Colors.black54;
      colorImageBottomNavigationBarItem = Colors.black87;
      colorTitleShowAvata = colorHexa("040507");
      colorColumnShowSaveReadLike = Colors.black87;
      colorLeadingAppbar = Colors.black;
      colorContainerPopualarMedia = Colors.white;
      backgroundColorAppBar = Colors.white;
    } else {
      _themeKey = AppThemeKeys.dark;
      colorContainerPopualarMedia = Colors.white24;
      // selectedItemColor = Colors.white;
      backgroundColorAppBar = colorHexa("303030");
      colorLeadingAppbar = Colors.white;
      colorImageBottomNavigationBarItem = Colors.white;
      colorComponentBottomProfile = Colors.white70;
      colorTitleComponentBottomProfile = Colors.white;
      colorContainerFavorite = Colors.white70;
      colorSizeBoxFavorite = Colors.white;
      colorContainerHotNews = Colors.white70;
      colorIconSearch = Colors.white70;
      unselectedLabelColor = Colors.white60;
      labelColor = Colors.white;
      indicatorColor = Colors.white70;
      colorContainerTitle = Colors.white;
      colorSizeBoxTitle = Colors.white38;
      colorContainerPriceCoins = Colors.white;
      colorTitleContainerSpecialForYou = Colors.white54;
      colorContentContainerSpecialForYou = Colors.white;
      colorImageContainerSpecialForYou = Colors.white;
      colorTitleShowAvata = Colors.white;
      colorColumnShowSaveReadLike = Colors.white;
    }
    notifyListeners();
  }
}
