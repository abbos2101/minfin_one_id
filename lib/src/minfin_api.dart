import 'package:dio/dio.dart';

const _baseUrl = "https://sso.egov.uz/sso/oauth/Authorization.do";

class MinfinApi {
  final _dio = Dio(BaseOptions(
    connectTimeout: 120000,
    receiveTimeout: 120000,
    sendTimeout: 120000,
  ));

  MinfinApi({
    required this.clientId,
    required this.redirectUri,
    required this.clientSecret,
    required this.scope,
    required this.state,
  });

  final String clientId;
  final String redirectUri;
  final String clientSecret;
  final String scope;
  final String state;

  String get initialUrl {
    return "$_baseUrl"
        "?response_type=one_code"
        "&client_id=$clientId"
        "&client_secret=$clientSecret"
        "&redirect_uri=$redirectUri"
        "&scope=$scope"
        "&state=$state";
  }

  Future<String> token(String code) async {
    final path = "$_baseUrl"
        "?grant_type=one_authorization_code"
        "&client_id=$clientId"
        "&client_secret=$clientSecret"
        "&redirect_uri=$redirectUri"
        "&code=$code";
    return (await _dio.post(path)).data["access_token"] ?? "";
  }

  Future<dynamic> getUser(String token) async {
    final path = "https://sso.egov.uz/sso/oauth/Authorization.do"
        "?grant_type=one_access_token_identify"
        "&client_id=$clientId"
        "&client_secret=$clientSecret"
        "&scope=$scope"
        "&access_token=$token";
    return (await _dio.post(path)).data;
  }

  Future<void> logout(String token) async {
    final path = "https://sso.egov.uz/sso/oauth/Authorization.do"
        "?grant_type=one_log_out"
        "&client_id=$clientId"
        "&client_secret=$clientSecret"
        "&scope=$scope"
        "&access_token=$token";
    await _dio.post(path);
  }
}
