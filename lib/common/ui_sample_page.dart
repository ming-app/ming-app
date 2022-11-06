// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ming/common/snackbar_service.dart';
import 'package:ming/common/ui/custom_editable_field.dart';
import 'package:ming/common/ui/ming_card_form.dart';
import 'package:ming/common/ui/pagination_bar.dart';
import 'package:ming/common/ui/pet_card_content.dart';
import 'package:ming/common/ui/shelter_card_content.dart';
import 'package:ming/pet_profile/mock/mock.dart';
import 'package:ming/pets/model/pet_overview_info.dart';
import 'package:ming/shelter_profile/mock/mock.dart';
import 'package:ming/shelters/mock/shelters_mock.dart';

class UiSamplePage extends StatefulWidget {
  const UiSamplePage({Key? key}) : super(key: key);

  @override
  State<UiSamplePage> createState() => _UiSamplePageState();
}

class _UiSamplePageState extends State<UiSamplePage> {
  final postEditableFormKey = GlobalKey<FormState>();
  final editableFormKey = GlobalKey<FormState>();
  var editableTextContent = "컨텐츠";
  var currentDate = DateTime.now();
  int largePagesNumber = 0;
  int smallPagesNumber = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                  if (value == null || value == "") return "닉네임을 입력해주세요.";
                  return null;
                },
                onSaveButtonClick: () async {
                  if (postEditableFormKey.currentState?.validate() ?? false) {
                    postEditableFormKey.currentState?.save();
                  }
                },
              ),
            ),
            Divider(),
            Text("EditableTextField"),
            Form(
              child: CustomEditableField(
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
                  if (value == null || value == "") return "닉네임을 입력해주세요.";
                  return null;
                },
                onSaveButtonClick: () async {
                  if (editableFormKey.currentState?.validate() ?? false) {
                    editableFormKey.currentState?.save();
                  }
                },
              ),
              key: editableFormKey,
            ),
            Divider(),
            Text("PostEditableDateField"),
            Form(
              child: PostEditableDateField(
                title: "생년월일",
                desc: "정확한 생년월일을 입력해주세요.",
                outlineColor: Colors.black,
              ),
            ),
            Divider(),
            Text("EditableDateField"),
            CustomEditableField(
              title: "생년월일",
              content: currentDate,
              desc: "정확한 생년월일을 입력해주세요.",
              fieldTitle: "생년월일",
              type: CustomEditableFieldType.date,
              onEditStateChange: (editState) {
                SnackbarService(context)
                    .showPlainTextSnackbar("edit state changed, $editState");
              },
              onSaved: (newValue) {
                SnackbarService(context)
                    .showPlainTextSnackbar("value saved, $newValue");
                setState(() {
                  currentDate = newValue;
                });
              },
            ),
            Divider(),
            Text("Card default format"),
            MingImageCard(
              onTap: () {},
            ),

            Divider(),
            Text("Shelter Profile Card GUI"),
            ShelterCardContent(mockShelters.first),
            Divider(),
            Text("Pet Profile Card GUI"),
            PetCardContent(
              PetOverviewInfo.mock(),
            ),
            Divider(),
            Text("Pagination GUI with large pages"),
            PaginationBar(
              pageNumber: largePagesNumber,
              totalPageNumber: 20,
              onPageChanged: (page) {
                setState(() {
                  largePagesNumber = page;
                });
              },
            ),
            Divider(),
            Text("Pagination GUI with small pages"),
            PaginationBar(
              pageNumber: smallPagesNumber,
              totalPageNumber: 6,
              onPageChanged: (page) {
                setState(() {
                  smallPagesNumber = page;
                });
              },
            ),

            SizedBox(
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
