import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class EditableTextField extends StatefulWidget {
  final String title;
  final String content;
  final String desc;
  final String fieldTitle;
  final bool grayed;
  final void Function(bool editState)? onEditStateChange;
  final FormFieldSetter? onSaved;
  final FormFieldValidator? validator;
  final void Function()? onSave;

  const EditableTextField({
    Key? key,
    required this.title,
    required this.content,
    required this.desc,
    required this.fieldTitle,
    this.grayed = false,
    this.onEditStateChange,
    this.onSaved,
    this.validator,
    this.onSave,
  }) : super(key: key);

  @override
  State<EditableTextField> createState() => _EditableTextFieldState();
}

class _EditableTextFieldState extends State<EditableTextField> {
  bool editState = false;

  Widget get getFieldWidget {
    if (widget.grayed) return getPreEditableWidget;
    return editState ? getPostEditableWidget : getPreEditableWidget;
  }

  Widget get getPreEditableWidget => PreEditableTextField(
        title: widget.title,
        content: widget.content,
        grayed: widget.grayed,
        onEdit: () {
          widget.onEditStateChange?.call(true);
          setState(() {
            editState = true;
          });
        },
      );
  Widget get getPostEditableWidget => PostEditablePlainTextField(
        title: widget.title,
        desc: widget.desc,
        fieldTitle: widget.fieldTitle,
        onCancel: () {
          widget.onEditStateChange?.call(false);
          setState(() {
            editState = false;
          });
        },
        onSaved: ((newValue) {
          widget.onSaved?.call(newValue);
          setState(() {
            editState = false;
          });
        }),
        onSave: widget.onSave,
        validator: widget.validator,
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      child: getFieldWidget,
    );
  }
}

class PreEditableTextField extends StatelessWidget {
  final String title;
  final String content;
  final bool grayed;
  final void Function()? onEdit;

  const PreEditableTextField({
    Key? key,
    this.onEdit,
    required this.title,
    required this.content,
    this.grayed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: theme.textTheme.bodyText2?.copyWith(
                color: grayed ? Colors.grey : null,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: grayed ? null : onEdit,
              child: Text(
                S.of(context).edit,
                style: theme.textTheme.bodyText2?.copyWith(
                  decoration: TextDecoration.underline,
                  color: grayed ? Colors.grey : null,
                ),
              ),
            ),
          ],
        ),
        Text(
          content,
          style: theme.textTheme.caption?.copyWith(
            color: grayed ? Colors.grey : null,
          ),
        ),
      ],
    );
  }
}

class PostEditablePlainTextField extends StatelessWidget {
  final String title;
  final String desc;
  final String fieldTitle;
  final void Function()? onCancel;
  final FormFieldSetter? onSaved;
  final FormFieldValidator? validator;
  final void Function()? onSave;

  const PostEditablePlainTextField({
    Key? key,
    required this.title,
    required this.desc,
    required this.fieldTitle,
    this.onCancel,
    this.onSaved,
    this.validator,
    this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: theme.textTheme.bodyText2,
            ),
            const Spacer(),
            TextButton(
              onPressed: onCancel,
              child: Text(
                S.of(context).cancel,
                style: theme.textTheme.bodyText2?.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fieldTitle,
                  style: theme.textTheme.caption,
                ),
                TextFormField(
                  style: theme.textTheme.bodyText2,
                  onSaved: onSaved,
                  validator: validator,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(5),
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
        ),
        ElevatedButton(onPressed: onSave, child: Text(S.of(context).save)),
      ],
    );
  }
}
