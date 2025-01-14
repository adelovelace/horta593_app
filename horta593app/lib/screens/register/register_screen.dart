import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:horta593app/blocs/auth/auth_bloc.dart';
import 'package:horta593app/exceptions/form_exceptions.dart';
import 'package:horta593app/screens/home/base_screen.dart';
import 'package:horta593app/widgets/form_error_widget.dart';
import 'package:horta593app/widgets/success_dialog.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../constants/global_variables.dart';
import 'bloc/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  void submitForm(BuildContext context) {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final data = _formKey.currentState?.value;
      context.read<RegisterBloc>().add(
            RegisterRequestEvent(
              email: data!['email'],
              password: data['password'],
              firstName: data['first_name'],
              lastName: data['last_name'],
            ),
          );
    }
  }

  Future<bool> popScreen(state) async {
    return state is! RegisterLoadingState;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return BlocProvider(
          create: (context) => RegisterBloc(),
          child: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccessState) {
                context.read<AuthBloc>().add(
                      AuthAuthenticateEvent(state.user),
                    );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const SuccessDialog(
                      title: 'Success',
                      text: 'Your register was successful!',
                      buttonText: 'Continue',
                    );
                  },
                );
              }
            },
            builder: (context, state) {
              return WillPopScope(
                onWillPop: () => popScreen(state),
                child: Scaffold(
                  body: Builder(
                    builder: (_) {
                      return Center(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: FormBuilder(
                              key: _formKey,
                              child: Builder(builder: (context) {
                                if (state is RegisterErrorState) {
                                  if (state.exception is FormFieldsException) {
                                    for (var error in (state.exception
                                            as FormFieldsException)
                                        .errors
                                        .entries) {
                                      _formKey.currentState?.invalidateField(
                                        name: error.key,
                                        errorText: error.value,
                                      );
                                    }
                                  }
                                }

                                return Column(
                                  children: [
                                    Builder(builder: (context) {
                                      if (state is RegisterErrorState) {
                                        if (state.exception
                                            is FormGeneralException) {
                                          return Column(
                                            children: [
                                              FormErrorWidget(
                                                (state.exception
                                                        as FormGeneralException)
                                                    .message,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              )
                                            ],
                                          );
                                        }
                                      }
                                      return Container();
                                    }),
                                    const Image(
                                        width: 400,
                                        height: 400,
                                        image: AssetImage(
                                            'lib/constants/images/logo_dark.png')),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Center(
                                      child: Text(
                                        "Register",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: GlobalVariables.greyHorta,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 30, right: 30),
                                      child: FormBuilderTextField(
                                        style: const TextStyle(
                                            color:
                                                GlobalVariables.whitebackgound),
                                        name: 'first_name',
                                        decoration: const InputDecoration(
                                            labelStyle: TextStyle(
                                                fontSize: 14,
                                                color: GlobalVariables
                                                    .whitebackgound),
                                            labelText: "First Name",
                                            contentPadding: EdgeInsets.all(10),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                              color: GlobalVariables.greenHorta,
                                            )),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                              color: GlobalVariables.greenHorta,
                                            ))),
                                        textInputAction: TextInputAction.done,
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                          FormBuilderValidators.match(
                                            context,
                                            r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$",
                                          ),
                                        ]),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 30, right: 30),
                                      child: FormBuilderTextField(
                                        style: const TextStyle(
                                            color:
                                                GlobalVariables.whitebackgound),
                                        name: 'last_name',
                                        decoration: const InputDecoration(
                                            labelStyle: TextStyle(
                                                fontSize: 14,
                                                color: GlobalVariables
                                                    .whitebackgound),
                                            labelText: "Last Name",
                                            contentPadding: EdgeInsets.all(10),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                              color: GlobalVariables.greenHorta,
                                            )),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                              color: GlobalVariables.greenHorta,
                                            ))),
                                        textInputAction: TextInputAction.done,
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                          FormBuilderValidators.match(
                                            context,
                                            r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$",
                                          ),
                                        ]),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 30, right: 30),
                                      child: FormBuilderTextField(
                                        style: const TextStyle(
                                            color:
                                                GlobalVariables.whitebackgound),
                                        name: 'email',
                                        decoration: const InputDecoration(
                                            labelStyle: TextStyle(
                                                fontSize: 14,
                                                color: GlobalVariables
                                                    .whitebackgound),
                                            labelText: "Email",
                                            contentPadding: EdgeInsets.all(10),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                              color: GlobalVariables.greenHorta,
                                            )),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                              color: GlobalVariables.greenHorta,
                                            ))),
                                        textInputAction: TextInputAction.done,
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                          FormBuilderValidators.email(context),
                                        ]),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 30, right: 30),
                                      child: FormBuilderTextField(
                                        style: const TextStyle(
                                            color:
                                                GlobalVariables.whitebackgound),
                                        name: 'password',
                                        decoration: const InputDecoration(
                                            labelStyle: TextStyle(
                                                fontSize: 14,
                                                color: GlobalVariables
                                                    .whitebackgound),
                                            labelText: "Password",
                                            contentPadding: EdgeInsets.all(10),
                                            hintStyle: TextStyle(
                                                color:
                                                    GlobalVariables.greyHorta),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                              color: GlobalVariables.greenHorta,
                                            )),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                              color: GlobalVariables.greenHorta,
                                            ))),
                                        obscureText: true,
                                        textInputAction: TextInputAction.done,
                                        onSubmitted: (_) {
                                          if (state is! AuthLoadingState) {
                                            submitForm(context);
                                          }
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    OutlinedButton(
                                        onPressed: () {
                                          if (state is! RegisterLoadingState) {
                                            submitForm(context);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const BaseScreen()));
                                          }
                                        },
                                        child: const SizedBox(
                                          width: 380,
                                          child: Text(
                                            'Login',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )),
                                  ],
                                );
                              }),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
