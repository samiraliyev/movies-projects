class Endpoint {
  const Endpoint({
    required this.path,
    required this.port,
    this.prodPath,
  });

  final String path;
  final String? prodPath;
  final String port;
}

abstract class Ports {
  static const String p8009 = '8009';
}

abstract class Endpoints {
  static const String devBaseUrl = 'http://api-test.movie.io';
  static const String prodBaseUrl = 'http://api-test.movie.io';

  static const isProd = false;

  // it should be set to work properly
  // static Environment environment = Environment.development;

  static final excludeEndpoints = <String>[
    Endpoints.login.prodPath!,
    Endpoints.verifyOtp.prodPath!,
    Endpoints.register.prodPath!,
  ];
  static final temporaryTokenEndpoints = <String>[
    Endpoints.verifyOtp.prodPath!,
    Endpoints.register.prodPath!,
  ];

  static const _v1 = '/v1';

  static String get baseUrl {
    if (Endpoints.isProd) {
      return prodBaseUrl;
    }
    return devBaseUrl;
  }

  static const me = Endpoint(
    path: '$_v1/profile/',
    prodPath: '/profile/',
    port: Ports.p8009,
  );

  static const login = Endpoint(
    path: '$_v1/login/',
    prodPath: '/login/',
    port: Ports.p8009,
  );

  static const register = Endpoint(
    path: '$_v1/register/',
    prodPath: '/register/',
    port: Ports.p8009,
  );

  static const verifyOtp = Endpoint(
    path: '$_v1/verify-otp/',
    prodPath: '/verify-otp/',
    port: Ports.p8009,
  );

  static const logout = Endpoint(
    path: '$_v1/auth/logout',
    prodPath: '/auth/logout',
    port: Ports.p8009,
  );

  static const customerDelete = Endpoint(
    path: '$_v1/customer/delete/',
    prodPath: '/customer/delete/',
    port: Ports.p8009,
  );

  static const refresh = Endpoint(
    path: '$_v1/auth/refresh',
    prodPath: '/auth/refresh',
    port: Ports.p8009,
  );

  static const deviceTokenSet = Endpoint(
    path: '$_v1/auth/refresh',
    prodPath: '/auth/refresh',
    port: Ports.p8009,
  );

  static const productList = Endpoint(
    path: '$_v1/products/',
    prodPath: '/products/',
    port: Ports.p8009,
  );

  static const productDetails = Endpoint(
    path: '$_v1/products/:id/',
    prodPath: '/products/:id/',
    port: Ports.p8009,
  );

  static const createOrder = Endpoint(
    path: '$_v1/products/orders/',
    prodPath: '/products/orders/',
    port: Ports.p8009,
  );

  static const faqList = Endpoint(
    path: '$_v1/faqs/',
    prodPath: '/faqs/',
    port: Ports.p8009,
  );

  static const contactUsList = Endpoint(
    path: '$_v1/contact-us/',
    prodPath: '/contact-us/',
    port: Ports.p8009,
  );

  static const faqDetails = Endpoint(
    path: '$_v1/faqs/:id/',
    prodPath: '/faqs/:id/',
    port: Ports.p8009,
  );

  static const faqHelpful = Endpoint(
    path: '$_v1/faqs/:id/helpful/',
    prodPath: '/faqs/:id/helpful/',
    port: Ports.p8009,
  );

  static const faqNotHelpful = Endpoint(
    path: '$_v1/faqs/:id/helpful/',
    prodPath: '/faqs/:id/not-helpful/',
    port: Ports.p8009,
  );

  static const notificationList = Endpoint(
    path: '$_v1/notifications/',
    prodPath: '/notifications/',
    port: Ports.p8009,
  );

  static const notificationDetails = Endpoint(
    path: '$_v1/notifications/:id/?read=true',
    prodPath: '/notifications/:id/?read=true',
    port: Ports.p8009,
  );

  static const notificationCount = Endpoint(
    path: '$_v1/notifications/:id/?read=true',
    prodPath: '/notifications/:id/?read=true',
    port: Ports.p8009,
  );

  static const notificationMarkReadAll = Endpoint(
    path: '$_v1/notifications/read-all/',
    prodPath: '/notifications/read-all/',
    port: Ports.p8009,
  );

  static const deviceList = Endpoint(
    path: '$_v1/devices/',
    prodPath: '/devices/',
    port: Ports.p8009,
  );

  static const deviceDetails = Endpoint(
    path: '$_v1/devices/:id/',
    prodPath: '/devices/:id/',
    port: Ports.p8009,
  );

  static const changeDevicePinStatus = Endpoint(
    path: '$_v1/devices/:deviceId/pins/:pinId/',
    prodPath: '/devices/:deviceId/pins/:pinId/',
    port: Ports.p8009,
  );

  static const inviteMemberToDevice = Endpoint(
    path: '$_v1/devices/:deviceId/invite/',
    prodPath: '/devices/:deviceId/invite/',
    port: Ports.p8009,
  );

  static const removeMemberToDevice = Endpoint(
    path: '$_v1/devices/:deviceId/members/:memberId/',
    prodPath: '/devices/:deviceId/members/:memberId/',
    port: Ports.p8009,
  );

  static const deviceMemberList = Endpoint(
    path: '$_v1/devices/:deviceId/members/',
    prodPath: '/devices/:deviceId/members/',
    port: Ports.p8009,
  );

  static const carPlateList = Endpoint(
    path: '$_v1/car-plates/',
    prodPath: '/car-plates/',
    port: Ports.p8009,
  );

  static const carPlateDetails = Endpoint(
    path: '$_v1/car-plates/:id/',
    prodPath: '/car-plates/:id/',
    port: Ports.p8009,
  );

  static const weatherApi = Endpoint(
    path: 'https://api.openweathermap.org/data/3.0/onecall',
    prodPath: 'https://api.openweathermap.org/data/3.0/onecall',
    port: Ports.p8009,
  );
}

extension EndpointExt on Endpoints {
  static String path(Endpoint endpoint, {bool withVersion = true}) {
    if (Endpoints.isProd) {
      return '/api${endpoint.prodPath}';
    }
    if (withVersion) {
      return ':${endpoint.port}/api${endpoint.path}';
    }
    return ':${endpoint.port}/api${endpoint.prodPath!}';
  }
}
