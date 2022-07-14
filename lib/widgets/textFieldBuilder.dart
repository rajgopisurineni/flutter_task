
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/utils/common_style.dart';

class BuildTextField extends StatefulWidget {
  final String? hint;
  final String labelText;
  final TextEditingController controller;
  final Function(String?)? validator;
  final List<FilteringTextInputFormatter>? inputFormatter;
  final TextInputType? textInputType;
  final TextStyle? applyStyling;
  final bool password;

  const BuildTextField(this.labelText, this.controller,
      {this.hint, this.validator, this.inputFormatter, this.textInputType, this.applyStyling,this.password = false});

  @override
  _BuildTextFieldState createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing : 10,
      children: [
        Text(widget.labelText, style: widget.applyStyling ?? Theme.of(context).textTheme.subtitle1?.apply(color: Colors.black,fontSizeDelta: 1),),
        buildInputField(widget.controller,
            validator: widget.validator,
            hint:widget.hint,
            regExp: widget.inputFormatter,
            keyBoardType : widget.textInputType,
            password : widget.password,
            )
      ],
    );
  }

  Widget buildInputField(TextEditingController controller,
      {Function(String?)? validator,
        String? hint,dynamic regExp,
        TextInputType? keyBoardType = TextInputType.text, bool password = false}) {
    return Stack(children: [
      CommonStyling.shadowDecoration,
      TextFormField(
        obscureText: password,
        style: const TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            errorMaxLines: 2,
            filled: true,
            hintText: hint),
        controller: controller,
        validator: validator != null ? (val) => validator(val) : (val) {
          return null;
        },
        inputFormatters: regExp,
        keyboardType: keyBoardType,
      ),
    ]);
  }

}
