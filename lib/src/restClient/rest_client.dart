import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:fe_lab_clinicas_core/src/restClient/intercpetors/auth_interceptor.dart';

final class RestClient extends DioForNative {
  RestClient(String baseURL)
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

  RestClient get auth {
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }

  RestClient get unatuh {
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
}
