import 'package:flutter/material.dart';
import 'package:flutter_task/providers/login_page_provider.dart';
import 'package:flutter_task/routes.dart';
import 'package:flutter_task/utils/labels.dart';
import 'package:flutter_task/utils/validators.dart';
import 'package:flutter_task/widgets/textFieldBuilder.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    var provider = Provider.of<LoginPageProvider>(context, listen: false);
    provider.logIdInputController.text = "demo@demo.com";
    provider.passwordInputController.text =  "123456";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
          appBar: AppBar(
            elevation: 3,
            shadowColor: Colors.black,
            backgroundColor: Colors.blue,
            title: Text(Labels.welCome,
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle2
                    ?.apply(
                    color: Colors.white, fontSizeDelta: 10, fontWeightDelta: 2)),
            centerTitle: true,
          ),
          body: Consumer<LoginPageProvider>(builder: (_, provider, child) =>
              Center(
                child: Card(
                  margin: const EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Form(
                      key: provider.formKey,
                      autovalidateMode: provider.autoValidation
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      child: Wrap(
                        runSpacing: 24,
                        children: [
                          BuildTextField(Labels.email, provider.logIdInputController,
                            hint: Labels.email, validator: (value) => Validator().emailValidator(value)),
                          BuildTextField(
                            Labels.password, provider.passwordInputController,
                            hint: Labels.password,password: true,
                          validator: (value) => Validator().passwordValidator(value),),
                          _buildSubmitButton(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    var provider = Provider.of<LoginPageProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: OutlinedButton(
          onPressed: () => provider.onClickOfLogin(context),
          child: Text(Labels.login.toUpperCase()))),
    );
  }

}
