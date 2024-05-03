import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final baseURL = "http://192.168.0.59:8080";
final dio = Dio(
  BaseOptions(
    baseUrl: baseURL,
    contentType: "application/json; charset=utf-8",
    validateStatus: (status) => true,
  ),
);

const secureStorage = FlutterSecureStorage();

// 인터셉터 생성
var interceptor = InterceptorsWrapper(
  onRequest: (options, handler) async {
    var accessToken = await secureStorage.read(key: 'accessToken');
    print("나 토큰: $accessToken");

    if (accessToken != null) {
      options.headers["Authorization"] = "Bearer $accessToken";
    } else {
      print("토큰이 없습니다.");
    }

    return handler.next(options);
  },
  onResponse: (response, handler) {
    // 로그인 요청에 대한 응답인지 확인
    if (response.requestOptions.path == "/api/login") {
      // 응답에서 토큰 추출
      print("응답 데이터: ${response.data}");

      var authorizationHeader = response.headers["Authorization"];
      if (authorizationHeader != null) {
        var accessToken = authorizationHeader[0].split("Bearer ")[1];
        // 추출한 토큰을 사용하거나 저장할 수 있음
        // 여기서는 토큰을 출력하는 예시를 보여줌
        print("Received Access Token: $accessToken");
      }
    }
    return handler.next(response);
  },
  onError: (DioError error, handler) {
    // 오류를 가로채고 처리하는 로직을 작성
    // 예를 들어, 인증 오류 처리 등
    return handler.next(error); // 다음 단계로 오류 전달
  },
);
