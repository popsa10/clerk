import 'package:clerk/shared/components/defaults.dart';
import 'package:clerk/shared/cubit/cubit.dart';
import 'package:clerk/shared/cubit/states.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../shared/constants.dart';

class SummarizationScreen extends StatefulWidget {
  @override
  _SummarizationScreenState createState() => _SummarizationScreenState();
}

class _SummarizationScreenState extends State<SummarizationScreen> {
  final TextEditingController inputFieldController = TextEditingController();
  final TextEditingController outputFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowGlow();
          return;
        },
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {
            if (state is SummarizeTextSuccessState) {
              outputFieldController.text =
                  AppCubit.get(context).summarizationModel.summary;
            }
          },
          builder: (context, state) {
            return ConditionalBuilder(
              condition: true,
              builder: (context) => SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      decoration: kCustomBoxDecoration,
                      child: Stack(
                        children: [
                          TextFormField(
                            controller: inputFieldController,
                            maxLines: null,
                            minLines: 12,
                            showCursor: true,
                            cursorColor: kPrimaryColor,
                            onChanged: (value) {
                              if (inputFieldController.text.isEmpty)
                                outputFieldController.text = "";
                              AppCubit.get(context).changeUploadIcon(
                                  isShow: false, icon: Icons.upload_file);
                              if (inputFieldController.text.isNotEmpty)
                                AppCubit.get(context).changeUploadIcon(
                                  isShow: true,
                                  icon: null,
                                );
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Enter Text Here'),
                          ),
                          uploadFile(
                              controller: inputFieldController,
                              context: context),
                          submitButton(
                              context: context,
                              controller: inputFieldController,
                              function: () {
                                AppCubit.get(context).summarizeText(
                                    text: inputFieldController.text);
                              })
                        ],
                      ),
                    ),
                    if (state is SummarizeTextLoadingState)
                      Column(
                        children: [
                          SpinKitThreeBounce(
                            color: kSecondaryColor,
                            size: 30,
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    outputWidget(
                        outputFieldController: outputFieldController,
                        inputFieldController: inputFieldController),
                  ],
                ),
              ),
              fallback: (context) => Center(child: kLoadingCircle),
            );
          },
        ));
  }
}
