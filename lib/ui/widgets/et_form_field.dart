import 'package:todo/todo.dart';

class EtFormField extends StatelessWidget {
  final String labelText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? initVal;
  final bool? isPassword;
  final TextEditingController? controller;
  final double? containerHeight;
  final double? containerWidth;
  final Widget? prefix;
  final bool? autofocus;
  final Function(String?)? onChange;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String?)? onFieldSubmitted;

  const EtFormField({
    Key? key,
    required this.labelText,
    this.maxLines,
    this.keyboardType,
    this.initVal,
    this.isPassword,
    this.controller,
    this.containerHeight,
    this.containerWidth,
    this.prefix,
    this.autofocus,
    this.onChange,
    this.validator,
    this.onSaved,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = 10.0;
    return Container(
      height: containerHeight,
      width: containerWidth,
      decoration: BoxDecoration(
        // color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextFormField(
        autofocus: autofocus ?? false,
        onChanged: onChange,
        decoration: InputDecoration(
          labelStyle: Theme.of(context).textTheme.bodyText1,
          contentPadding: const EdgeInsets.all(12),
          focusColor: Theme.of(context).primaryColor,
          fillColor: Theme.of(context).canvasColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).errorColor),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).errorColor),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          labelText: labelText,
          prefixIcon: prefix,
        ),
        keyboardType: keyboardType,
        obscureText: isPassword ?? false,
        style: Theme.of(context).textTheme.bodyText2,
        initialValue: initVal ?? null,
        controller: controller,
        maxLines: maxLines ?? 1,
        validator: validator,
        onSaved: onSaved,
        onFieldSubmitted: onFieldSubmitted,
      ),
      // margin: EdgeInsets.only(
      //   left: widthScreenPercent(5, context),
      //   right: widthScreenPercent(5, context),
      // ),
    );
  }
}
