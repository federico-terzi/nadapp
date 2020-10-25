import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/actions/auth_actions.dart';
import 'package:nad_app/actions/navigation_actions.dart';
import 'package:nad_app/actions/sync_actions.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/auth_state.dart';
import 'package:nad_app/presentation/app_scaffold.dart';
import 'package:nad_app/presentation/big_button.dart';
import 'package:nad_app/presentation/fading_scaffold.dart';
import 'package:nad_app/screens/login/login_phase_one_form.dart';
import 'package:nad_app/server_config.dart';
import 'package:quiver/core.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../routes.dart';
import 'login_phase_two_form.dart';

class SpidWebviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthState>(
      converter: (store) => store.state.auth,
      builder: (context, authState) {
        return Scaffold(
          appBar: new AppBar(
            title: const Text('Login con SPID'),
          ),
          body: WebView(
            initialUrl: SPID_LOGIN_ENDPOINT,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (String url) {
              print("spid webview url: $url");
              if (url.contains("/spid/success?token=")) { // Successful spid login
                RegExp tokenRegex = new RegExp(
                  r"\/spid\/success\?token=(.*)",
                );
                var matches = tokenRegex.allMatches(url);
                var match = matches.elementAt(0);
                String token = match.group(1);
                if (token != null) {
                  String trimmedToken = Uri.decodeComponent(token.trim());
                  StoreProvider.of<AppState>(context).dispatch(
                      ConvertTokenRequest(token: trimmedToken));
                } else {
                  StoreProvider.of<AppState>(context).dispatch(
                      LoginPhaseOneFailed(message: "Impossible completare l'accesso con SPID"));
                }
              }
            },
          ),
        );
      },
    );
  }
}
