import 'package:flutter/material.dart';

import '../../components/component.dart';

import 'login_presenter.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;

  const LoginPage({this.presenter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            LoginHeader(),
            SizedBox(
              height: 32,
            ),
            Headline1(text: 'Login'),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                child: Column(
                  children: [
                    StreamBuilder<String>(
                      stream: presenter.emailErrorStream,
                      builder: (context, snapshot) {
                        return TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            icon: Icon(
                              Icons.email,
                              color: Theme.of(context).primaryColorLight,
                            ),
                            errorText: snapshot.data,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: presenter.validateEmail,
                        
                        );
                      }
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        icon: Icon(
                          Icons.lock,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      obscureText: true,
                      onChanged: presenter.validatePassword,
                    ),
                    SizedBox(height: 32),
                    RaisedButton(
                      onPressed: null,
                      child: Text(
                        'Entrar'.toUpperCase(),
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: Text(
                    //     'Entrar'.toUpperCase(),
                    //   ),
                    // ),
                    FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.person),
                      label: Text('Criar Conta'),
                    )
                    // TextButton(
                    //   onPressed: () {},
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Icon(Icons.person),
                    //       SizedBox(
                    //         width: 8,
                    //       ),
                    //       Text('Criar Conta'),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
