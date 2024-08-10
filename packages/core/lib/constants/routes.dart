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
  static const marketplace = '/marketplace';
  static const productDetails = '$marketplace/${SubRoutes.details}';
  static const productOrderSuccess = '$marketplace/${SubRoutes.success}';
  static const devices = '/devices';
  static const deviceAdd = '$devices/${SubRoutes.add}';
  static const deviceDetected = '$devices/${SubRoutes.add}/${SubRoutes.detect}';
  static const deviceAddManually = '$devices/${SubRoutes.addManually}';
  static const deviceConnected =
      '$devices/${SubRoutes.add}/${SubRoutes.connected}';
  static const deviceEdit = '$devices/${SubRoutes.edit}';
  static const deviceManagement = '$devices/${SubRoutes.deviceManagement}';
  static const deviceDetails = '$devices/${SubRoutes.details}';
  static const profile = '/profile';
  static const editProfile = '$profile/${SubRoutes.editProfile}';
  static const deleteAccount = '$profile/${SubRoutes.deleteAccount}';
  static const notificationSettings =
      '$profile/${SubRoutes.notificationSettings}';
  static const editProfileForm =
      '$profile/${SubRoutes.editProfile}/${SubRoutes.editProfileForm}';
  static const termsConditions = '$profile/${SubRoutes.termsConditions}';
  static const privacyPolicy = '$profile/${SubRoutes.privacyPolicy}';
  static const userAgreement = '$profile/${SubRoutes.userAgreement}';
  static const changeLanguage = '$profile/${SubRoutes.changeLanguage}';
  static const myOrders = '$profile/${SubRoutes.myOrders}';
  static const helpCenter = '$profile/${SubRoutes.helpCenter}';
  static const deviceMemberList = '$devices/${SubRoutes.memberList}';
  static const membersAdd = '$deviceMemberList/${SubRoutes.add}';
  static const membersSuccess = '$deviceMemberList/${SubRoutes.success}';
  static const carPlates = '$profile/${SubRoutes.carPlates}';
  static const carPlatesAdd =
      '$profile/${SubRoutes.carPlates}/${SubRoutes.add}';
  static const carPlatesSuccess =
      '$profile/${SubRoutes.carPlates}/${SubRoutes.success}';

  static const addAccount = '/add-account';
  static const addAccountOtpCode = '$addAccount/${SubRoutes.otpCode}';

  static const account = '/account';
  static const accountDocumentPreview = '/account-document-preview';
  static const settings = '/settings';
  static const changePin = '$settings/${SubRoutes.changePin}';
  static const kpi = '/kpi';

  static const dashboard = '/dashboard';
  static const storyView = '/story-view/:initialPage';

  static const notificationList = '/notifications';
  static const notificationDetails = '$notificationList/${SubRoutes.details}';
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
