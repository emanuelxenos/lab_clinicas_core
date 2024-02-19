import 'package:dio/browser.dart';
import 'package:dio/dio.dart';
import 'package:fe_lab_clinicas_core/src/restClient/intercpetors/auth_interceptor.dart';

final class RestClientWeb extends DioForBrowser {
  RestClientWeb(String baseURL)
      : super(BaseOptions(
          baseUrl: baseURL,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 60),
        )) {
    interceptors.addAll([
      LogInterceptor(requestBody: true, responseBody: true),
      AuthInterceptor(),
    ]);
  }

  RestClientWeb get auth {
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }

  RestClientWeb get unatuh {
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
}
