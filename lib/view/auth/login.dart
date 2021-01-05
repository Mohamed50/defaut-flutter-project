import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:saydek/utils/dialog_utils.dart';
import 'package:saydek/utils/routes.dart';
import 'package:saydek/utils/utils.dart';
import 'package:saydek/view/static/neumorphism-container.dart';
import 'package:saydek/view/static/translatable-text.dart';

class LoginPage extends StatelessWidget {

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Color color = Color(0xFFf5f5f5);
  final phoneFormatter = new MaskTextInputFormatter(
      mask: '## ### ####', filter: {"#": RegExp(r'[0-9]')});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      backgroundColor: color,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/bg3.jpg",
                )),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TranslatableText(
                        "Login",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey[900]),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TranslatableText(
                        "Phone",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: Colors.grey[900]),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      CardContainer(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        child: Row(
                          textDirection: TextDirection.ltr,
                          children: [
                            Text(
                              "+249",
                              textDirection: TextDirection.ltr,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Expanded(
                              flex: 7,
                              child: TextFormField(
                                controller: _phoneController,
                                inputFormatters: [phoneFormatter],
                                keyboardType: TextInputType.number,
                                textDirection: TextDirection.ltr,
                                validator: (value) {
                                  if (value == null)
                                    return "Please enter a valid phone number";
                                  return null;
                                },
                                decoration: InputDecoration.collapsed(
                                  hintText: "12 345 6789",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TranslatableText(
                        "Password",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: Colors.grey[900]),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      CardContainer(
                        color: color,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null)
                              return "Please enter a valid password";
                            return null;
                          },
                          decoration: InputDecoration.collapsed(
                              hintText: "******",
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0,),
                          child: TranslatableText(
                            "Forget Password",
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                .copyWith(color: Colors.grey[900]),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(forgetPasswordRoute);
                        },
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Center(
                        child: ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            elevation: 2,
                            color: Colors.grey[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TranslatableText(
                                "Login",
                                style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white),
                              ),
                            ),
                            onPressed: () => login(context),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: TranslatableText(
                      "Sign Up",
                      style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(registerRoute);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login(context) {
    String phone = _phoneController.value.text.replaceAll(RegExp(r"\s+"), "");
    if (_formKey.currentState.validate() && isValidPhone(phone)) {
      // Provider.of<AuthProvider>(context, listen: false)
      //     .signIn(context, "249" + phone, _passwordController.value.text);
    } else {
      showMessageDialog(context, "Please enter a valid phone number");
    }
  }
}
