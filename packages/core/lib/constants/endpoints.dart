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
  static const String devBaseUrl = 'https://moviesdatabase.p.rapidapi.com';
  static const String prodBaseUrl = 'https://moviesdatabase.p.rapidapi.com';

  static const isProd = true;

  // it should be set to work properly
  // static Environment environment = Environment.development;

  static final excludeEndpoints = <String>[
    // Endpoints.login.prodPath!,
    // Endpoints.verifyOtp.prodPath!,
    // Endpoints.register.prodPath!,
  ];
  static final temporaryTokenEndpoints = <String>[
    // Endpoints.verifyOtp.prodPath!,
    // Endpoints.register.prodPath!,
  ];

  static const _v1 = '/v1';

  static String get baseUrl {
    if (Endpoints.isProd) {
      return prodBaseUrl;
    }
    return devBaseUrl;
  }

  // static const me = Endpoint(
  //   path: '$_v1/profile/',
  //   prodPath: '/profile/',
  //   port: Ports.p8009,
  // );
  //
  // static const login = Endpoint(
  //   path: '$_v1/login/',
  //   prodPath: '/login/',
  //   port: Ports.p8009,
  // );
  //
  // static const register = Endpoint(
  //   path: '$_v1/register/',
  //   prodPath: '/register/',
  //   port: Ports.p8009,
  // );
  //
  // static const verifyOtp = Endpoint(
  //   path: '$_v1/verify-otp/',
  //   prodPath: '/verify-otp/',
  //   port: Ports.p8009,
  // );
  //
  // static const logout = Endpoint(
  //   path: '$_v1/auth/logout',
  //   prodPath: '/auth/logout',
  //   port: Ports.p8009,
  // );
  //
  // static const customerDelete = Endpoint(
  //   path: '$_v1/customer/delete/',
  //   prodPath: '/customer/delete/',
  //   port: Ports.p8009,
  // );
  //
  static const refresh = Endpoint(
    path: '$_v1/auth/refresh',
    prodPath: '/auth/refresh',
    port: Ports.p8009,
  );

  // static const deviceTokenSet = Endpoint(
  //   path: '$_v1/auth/refresh',
  //   prodPath: '/auth/refresh',
  //   port: Ports.p8009,
  // );

  static const genreList = Endpoint(
    path: '$_v1/titles/utils/genres/',
    prodPath: '/titles/utils/genres/',
    port: Ports.p8009,
  );
}

extension EndpointExt on Endpoints {
  static String path(Endpoint endpoint) {
    if (Endpoints.isProd) {
      return '/api${endpoint.prodPath}';
    }

    return ':${endpoint.port}/api${endpoint.prodPath!}';
  }
}
