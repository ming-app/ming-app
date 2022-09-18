// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ming/common/snackbar_service.dart';
import 'package:ming/common/ui/editable_textfield.dart';
import 'package:ming/common/ui/ming_card_form.dart';
import 'package:ming/common/ui/pet_card_content.dart';
import 'package:ming/common/ui/shelter_card_content.dart';
import 'package:ming/pet_profile/mock/mock.dart';
import 'package:ming/shelter_profile/mock/mock.dart';

class UiSamplePage extends StatefulWidget {
  const UiSamplePage({Key? key}) : super(key: key);

  @override
  State<UiSamplePage> createState() => _UiSamplePageState();
}

class _UiSamplePageState extends State<UiSamplePage> {
  final postEditableFormKey = GlobalKey<FormState>();
  final editableFormKey = GlobalKey<FormState>();
  var editableTextContent = "컨텐츠";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // PreEditable Text default
          Text("PreEditableTextField"),
          PreEditableTextField(
            title: "닉네임",
            content: "컨텐츠",
            onEdit: () {},
          ),
          Divider(),
          // PreEditable Text grayed
          Text("PreEditableTextField, grayed: true"),
          PreEditableTextField(
            title: "닉네임",
            content: "컨텐츠",
            grayed: true,
            onEdit: () {},
          ),
          Divider(),
          // PostEditablePlainTextField
          Text("PostEditableTestField"),
          Form(
            key: postEditableFormKey,
            child: PostEditablePlainTextField(
              title: "닉네임",
              desc: "불리고 싶은 이름을 입력해주세요.",
              fieldTitle: "닉네임",
              onSaved: (newValue) {
                SnackbarService(context)
                    .showPlainTextSnackbar("value saved, $newValue");
              },
              validator: (value) {
                return null;
              },
              onSave: () async {
                if (postEditableFormKey.currentState?.validate() ?? false) {
                  postEditableFormKey.currentState?.save();
                }
              },
            ),
          ),
          Divider(),
          Text("EditableTextField"),
          Form(
            child: EditableTextField(
              title: "닉네임",
              content: editableTextContent,
              desc: "불리고 싶은 이름을 입력해주세요.",
              fieldTitle: "닉네임",
              onEditStateChange: (editState) {
                SnackbarService(context)
                    .showPlainTextSnackbar("edit state changed, $editState");
              },
              onSaved: (newValue) {
                SnackbarService(context)
                    .showPlainTextSnackbar("value saved, $newValue");
                setState(() {
                  editableTextContent = newValue;
                });
              },
              validator: (value) {
                return null;
              },
              onSave: () async {
                if (editableFormKey.currentState?.validate() ?? false) {
                  editableFormKey.currentState?.save();
                }
              },
            ),
            key: editableFormKey,
          ),
          Divider(),
          Text("Card default format"),
          MingCard(
            onTap: () {},
          ),

          Divider(),
          Text("Shelter Profile Card GUI"),
          ShelterCardContent(shelterMock),
          Divider(),
          Text("Pet Profile Card GUI"),
          PetCardContent(
            petMock,
          ),
          SizedBox(
            height: 200,
          )
        ],
      ),
    );
  }
}
