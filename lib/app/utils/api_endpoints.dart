class ApiEndPoints {
  // static final String baseUrl = 'http://restapi.adequateshop.com/api/';
  static final String baseUrl = 'https://api.hijaudaun.my.id/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'authaccount/registration';
  // final String loginEmail = 'authaccount/login';
  final String loginEmail = 'api/login';
  final String books = 'api/books';
}
