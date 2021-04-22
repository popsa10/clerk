import 'package:clerk/view/signin_screens/components/Custom_form_field.dart';
import 'package:clerk/view_model/Provider/FirebaseProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

AlertDialog alert(
    {context, String title, key, value, TextEditingController controller}) {
  final provider = Provider.of<FireStoreProvider>(context);
  return AlertDialog(
    title: Text(title),
    backgroundColor: kDialogBoxColor,
    content: CustomFormField(
      controller: controller,
    ),
    actions: [
      TextButton(
          onPressed: () {
            provider.updateData(key: key, value: controller.text);
            Navigator.pop(context);
          },
          child: Text("Save")),
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"))
    ],
  );
}
