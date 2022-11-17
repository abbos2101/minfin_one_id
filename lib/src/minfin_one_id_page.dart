import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'bloc/login_bloc.dart';
import 'minfin_api.dart';

class MinfinOneIDPage extends StatefulWidget {
  final String clientId;
  final String redirectUri;
  final String clientSecret;
  final String scope;
  final String state;
  final Widget? background;
  final Function(dynamic data)? onGetData;

  const MinfinOneIDPage({
    Key? key,
    required this.clientId,
    required this.redirectUri,
    required this.clientSecret,
    required this.scope,
    required this.state,
    this.background,
    this.onGetData,
  }) : super(key: key);

  @override
  State<MinfinOneIDPage> createState() => _MinfinOneIDPageState();
}

class _MinfinOneIDPageState extends State<MinfinOneIDPage> {
  late final bloc = LoginBloc(MinfinApi(
    clientId: widget.clientId,
    redirectUri: widget.redirectUri,
    clientSecret: widget.clientSecret,
    scope: widget.scope,
    state: widget.state,
  ))
    ..add(LoginEvent.init());
  late final WebViewController controller;

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) async {
          if (state.status == EnumStatus.loading) {
            EasyLoading.show();
          } else if (state.status == EnumStatus.fail) {
            EasyLoading.showError(state.message);
            if (mounted) Navigator.pop(context);
          } else if (state.status == EnumStatus.success) {
            widget.onGetData?.call(state.user);
          } else if (state.status == EnumStatus.next) {
            EasyLoading.dismiss();
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  state.progress == 100
                      ? const SizedBox()
                      : LinearProgressIndicator(
                          value: state.progress / 100,
                          backgroundColor: Colors.grey[200],
                          color: Colors.grey,
                          minHeight: 8,
                        ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (state.initialUrl.isEmpty) return const SizedBox();
                        if (state.status == EnumStatus.next &&
                            widget.background != null) {
                          return widget.background!;
                        }
                        return WebView(
                          initialUrl: state.initialUrl,
                          javascriptMode: JavascriptMode.unrestricted,
                          onWebViewCreated: (ctrl) async {
                            controller = ctrl;
                            await controller.clearCache();
                          },
                          onProgress: (value) async {
                            if (!mounted) return;
                            bloc.add(LoginEvent.changed(progress: value));
                            final url = await controller.currentUrl();
                            if (state.currentUrl != url) {
                              bloc.add(LoginEvent.changed(currentUrl: url));
                            }
                            if (kDebugMode) {
                              print("*** Url ***\n$url");
                            }
                          },
                          onWebResourceError: (error) {
                            if (!mounted) return;
                            bloc.add(LoginEvent.changed(progress: 100));
                            if (kDebugMode) {
                              print("Handle your Error Page here");
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
