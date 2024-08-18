abstract class Assets {
  static const images = _Images();
  static const icons = _Icons();
  static const fonts = _Fonts();
  static const files = _Files();
}

class _Images {
  const _Images();

  static const _basePath = 'assets/images';

  final logoHorizontalLogo = '$_basePath/logo_horizontal.png';
}

class _Icons {
  const _Icons();

  static const _basePath = 'assets/icons';

  final houseGetStarted = '$_basePath/house.svg';
}

class _Fonts {
  const _Fonts();

  final roboto = 'Roboto';
  final ginoraSans = 'GinoraSans';
}

class _Files {
  const _Files();

  static const _basePath = 'assets/secure';
  final credentialsEnv = '$_basePath/credentials.env';
}
