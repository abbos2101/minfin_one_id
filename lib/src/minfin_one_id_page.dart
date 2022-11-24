import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'minfin_api.dart';

class MinfinOneIDPage extends StatefulWidget {
  final String clientId;
  final String redirectUri;
  final String clientSecret;
  final String scope;
  final String state;
  final String langCode; //uz, ru, en, kr
  final Function(String url)? onChangeUrl;
  final Function()? onLoading;
  final Function(dynamic error)? onError;
  final Function(dynamic data)? onSuccess;

  const MinfinOneIDPage._({
    Key? key,
    required this.clientId,
    required this.redirectUri,
    required this.clientSecret,
    required this.scope,
    required this.state,
    this.langCode = "",
    this.onChangeUrl,
    this.onLoading,
    this.onError,
    this.onSuccess,
  }) : super(key: key);

  static MinfinOneIDPage? _instance;

  static void ensureInitialized({
    required String clientId,
    required String redirectUri,
    required String clientSecret,
    required String scope,
    required String state,
    String langCode = "",
    Function(String url)? onChangeUrl,
    Function()? onLoading,
    Function(dynamic error)? onError,
    Function(dynamic data)? onSuccess,
  }) {
    _instance = MinfinOneIDPage._(
      clientId: clientId,
      redirectUri: redirectUri,
      clientSecret: clientSecret,
      scope: scope,
      state: state,
      langCode: langCode,
      onChangeUrl: onChangeUrl,
      onLoading: onLoading,
      onError: onError,
      onSuccess: onSuccess,
    );
  }

  static MinfinOneIDPage instance([String langCode = ""]) {
    if (_instance != null) {
      _instance = MinfinOneIDPage._(
        clientId: _instance!.clientId,
        redirectUri: _instance!.redirectUri,
        clientSecret: _instance!.clientSecret,
        scope: _instance!.scope,
        state: _instance!.state,
        langCode: langCode,
        onChangeUrl: _instance!.onChangeUrl,
        onLoading: _instance!.onLoading,
        onError: _instance!.onError,
        onSuccess: _instance!.onSuccess,
      );
      return _instance!;
    }
    throw "MinfinOneIDPage ensureInitialized qilinmagan";
  }

  @override
  State<MinfinOneIDPage> createState() => _MinfinOneIDPageState();
}

class _MinfinOneIDPageState extends State<MinfinOneIDPage> {
  late final api = MinfinApi(
    clientId: widget.clientId,
    redirectUri: widget.redirectUri,
    clientSecret: widget.clientSecret,
    scope: widget.scope,
    state: widget.state,
  );
  late final WebViewController controller;
  var progress = 0;
  var initialUrl = "";
  var currentUrl = "";

  @override
  void initState() {
    Future(() => setState(() => initialUrl = api.initialUrl));
    super.initState();
  }

  String get lang {
    var lang = widget.langCode;
    if (widget.langCode == "uz") lang = "oz";
    if (widget.langCode == "kr") lang = "uz";
    return lang;
  }

  void changedUrl() async {
    if (currentUrl.contains("http://") || currentUrl.contains("https://")) {
      if (currentUrl.contains("://id.egov.uz/")) {
        if (currentUrl.contains("://id.egov.uz/?")) {
          await controller.loadUrl(currentUrl.replaceAll(
            "://id.egov.uz/?",
            "://id.egov.uz/$lang?",
          ));
        } else {
          if (!currentUrl.contains("://id.egov.uz/$lang?client_id")) {
            currentUrl = currentUrl
                .replaceAll("://id.egov.uz/uz?", "://id.egov.uz/$lang?")
                .replaceAll("://id.egov.uz/oz?", "://id.egov.uz/$lang?")
                .replaceAll("://id.egov.uz/ru?", "://id.egov.uz/$lang?")
                .replaceAll("://id.egov.uz/en?", "://id.egov.uz/$lang?");
            await controller.loadUrl(currentUrl);
          }
        }
        return;
      }
      if (currentUrl.contains("code=")) {
        const key = "code=";
        final index = currentUrl.indexOf("code=");
        widget.onLoading?.call();
        final code = currentUrl.substring(
          index + key.length,
          currentUrl.indexOf("&"),
        );
        try {
          final token = await api.token(code);
          final user = await api.getUser(token);
          await api.logout(token);
          widget.onSuccess?.call(user);
        } catch (e) {
          widget.onError?.call(e);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            progress == 100
                ? const SizedBox()
                : LinearProgressIndicator(
                    value: progress / 100,
                    backgroundColor: Colors.grey[200],
                    color: Colors.grey,
                    minHeight: 8,
                  ),
            Expanded(
              child: initialUrl.isEmpty
                  ? const SizedBox()
                  : WebView(
                      initialUrl: initialUrl,
                      javascriptMode: JavascriptMode.unrestricted,
                      backgroundColor: Colors.white,
                      onWebViewCreated: (ctrl) async {
                        controller = ctrl;
                        await controller.clearCache();
                      },
                      onProgress: (value) async {
                        if (!mounted) return;
                        setState(() => progress = value);
                        final url = await controller.currentUrl();
                        if (currentUrl != url) {
                          setState(() => currentUrl = url ?? "");
                          changedUrl();
                          widget.onChangeUrl?.call(url ?? "");
                        }
                      },
                      onWebResourceError: (error) {
                        if (!mounted) return;
                        setState(() => progress = 100);
                        widget.onError?.call(error);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
