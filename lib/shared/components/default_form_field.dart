import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class DefaultFormFiled extends StatelessWidget {
  const DefaultFormFiled({
    Key? key,
    required this.controller,
    required this.type,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.isPassword = false,
    required this.validate,
    required this.label,
    required this.prefix,
    this.suffix,
    this.suffixPressed,
    this.isClickable = true,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType type;
  final void Function(String)? onSubmit;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final bool isPassword;
  final String? Function(String?)? validate;
  final String label;
  final IconData prefix;
  final IconData? suffix;
  final Function()? suffixPressed;
  final bool isClickable;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);

        return TextFormField(
          controller: controller,
          keyboardType: type,
          obscureText: isPassword,
          enabled: isClickable,
          onFieldSubmitted: onSubmit,
          onChanged: onChange,
          onTap: onTap,
          validator: validate,
          style: TextStyle(
            color: cubit.isDarkMode ? Colors.white : Colors.black,
          ),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: cubit.isDarkMode ? Colors.white : Colors.black,
            ),
            prefixIcon: Icon(
              prefix,
              color: cubit.isDarkMode ? Colors.white : Colors.black,
            ),
            suffixIcon: suffix != null
                ? IconButton(
                    onPressed: suffixPressed,
                    icon: Icon(suffix),
                  )
                : null,
            border: const OutlineInputBorder(),
          ),
        );
      },
    );
  }
}
