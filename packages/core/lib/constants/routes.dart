abstract class AppRoutes {
  static const error = '/error';

  static const forceUpdate = '/force-update/:uType';

  static const splash = '/splash';
  static const getStarted = '/get-started';
  static const howToUse = '$getStarted/${SubRoutes.howToUse}';
  static const login = '/login';
  static const otpCodeLogin = '$login/${SubRoutes.otpCode}';
  static const setupLogin =
      '$login/${SubRoutes.otpCode}/${SubRoutes.setupLogin}';
  static const loginPin = '/login-pin';
  static const setPin = '$login/${SubRoutes.setPin}';
  static const setBiometrics = '$login/${SubRoutes.setBiometrics}';
  static const home = '/home';
  static const genreList = '/genre-list';
}

abstract class SubRoutes {
  static const otpCode = 'otp-code';
  static const setupLogin = 'set-up-login';
  static const setPin = 'set-pin';
  static const changePin = 'change-pin';
  static const setBiometrics = 'set-biometrics';

  static const add = 'add';
  static const addManually = 'add-manually';
  static const deviceManagement = 'device-management/:id';
  static const detect = 'detect';
  static const connected = 'connected';
  static const deleteAccount = 'delete-account';
  static const notificationSettings = 'notification-settings';
  static const editProfile = 'edit-profile';
  // static const deleteAccount = 'delete-account';
  static const editProfileForm = 'field/:field';
  static const details = 'details/:id';
  static const success = 'success';
  static const edit = 'edit/:id';
  static const howToUse = 'how-to-use';
  static const termsConditions = 'terms-conditions';
  static const privacyPolicy = 'privacy-policy';
  static const userAgreement = 'user-agreement';
  static const changeLanguage = 'change-language';
  static const myOrders = 'my-orders';
  static const helpCenter = 'help-center';
  static const carPlates = 'car-plates';
  static const memberList = 'member-list/:id';
  // static const addReservedNumber = 'select';
}
