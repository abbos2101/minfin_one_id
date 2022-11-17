import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'minfin_api.dart';

class MinfinOneIDPage extends StatefulWidget {
  final String clientId;
  final String redirectUri;
  final String clientSecret;
  final String scope;
  final String state;
  final Function(String url)? onChangeUrl;
  final Function()? onLoading;
  final Function(dynamic error)? onError;
  final Function(dynamic data)? onSuccess;

  const MinfinOneIDPage({
    Key? key,
    required this.clientId,
    required this.redirectUri,
    required this.clientSecret,
    required this.scope,
    required this.state,
    this.onChangeUrl,
    this.onLoading,
    this.onError,
    this.onSuccess,
  }) : super(key: key);

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

  void changedUrl() async {
    if (currentUrl.contains("http://") || currentUrl.contains("https://")) {
      const key = "code=";
      final index = currentUrl.indexOf(key);
      if (index != -1) {
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
      child: Scaffold(
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
