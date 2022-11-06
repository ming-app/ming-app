import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ming/common/constants.dart';
import 'package:ming/common/ming_icons.dart';

import '../../generated/l10n.dart';

final _dateFormat = DateFormat("y년 M월 d일");

enum CustomEditableFieldType {
  text,
  date,
}

class CustomEditableField<T> extends StatefulWidget {
  final CustomEditableFieldType type;
  final String title;
  final T content;
  final String desc;
  final String fieldTitle;
  final bool greyed;
  final void Function(bool editState)? onEditStateChange;
  final FormFieldSetter? onSaved;
  final FormFieldValidator? validator;

  const CustomEditableField({
    Key? key,
    required this.title,
    required this.content,
    required this.desc,
    required this.fieldTitle,
    this.type = CustomEditableFieldType.text,
    this.greyed = false,
    this.onEditStateChange,
    this.onSaved,
    this.validator,
  })  : assert(type == CustomEditableFieldType.text && content is String ||
            type == CustomEditableFieldType.date && content is DateTime),
        super(key: key);

  @override
  State<CustomEditableField> createState() => _CustomEditableFieldState();
}

class _CustomEditableFieldState extends State<CustomEditableField> {
  bool editState = false;

  String get contentString {
    switch (widget.type) {
      case CustomEditableFieldType.text:
        return widget.content;
      case CustomEditableFieldType.date:
        return _dateFormat.format(widget.content);
    }
  }

  Widget get getFieldWidget {
    if (widget.greyed) return getPreEditableWidget;

    if (!editState) {
      return getPreEditableWidget;
    }

    switch (widget.type) {
      case CustomEditableFieldType.text:
        return getPostEditableTextWidget;
      case CustomEditableFieldType.date:
        return getPostEditableDateWidget;
    }
  }

  Widget get getPreEditableWidget => PreEditableTextField(
        title: widget.title,
        content: contentString,
        grayed: widget.greyed,
        onEdit: widget.onSaved != null
            ? () {
                widget.onEditStateChange?.call(true);
                setState(() {
                  editState = true;
                });
              }
            : null,
      );
  Widget get getPostEditableTextWidget => PostEditablePlainTextField(
        initialText: widget.content,
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
          // no need to call onSaved for plain text, it will be called by globalkey.
        }),
        validator: widget.validator,
      );

  Widget get getPostEditableDateWidget => PostEditableDateField(
        title: widget.title,
        desc: widget.desc,
        initialDate: widget.content,
        onCancel: () {
          widget.onEditStateChange?.call(false);
          setState(() {
            editState = false;
          });
        },
        onSaved: (date) {
          setState(() {
            editState = false;
          });
          widget.onSaved?.call(date);
        },
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

    return Opacity(
      opacity: grayed ? 0.4 : 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: theme.textTheme.bodyMedium,
              ),
              const Spacer(),
              if (onEdit != null)
                TextButton(
                  onPressed: grayed ? null : onEdit,
                  child: Text(
                    S.of(context).edit,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
            ],
          ),
          Text(
            content,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: const Color(0xff949494),
            ),
          ),
        ],
      ),
    );
  }
}

InputDecoration _getFormFieldInputDecoration({
  required BuildContext context,
  required String labeText,
  required Color outlineColor,
  required bool hasValidator,
}) {
  final theme = Theme.of(context);

  return InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    labelText: labeText,
    labelStyle: theme.textTheme.bodySmall,
    contentPadding: const EdgeInsets.all(5),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: outlineColor, width: 1),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: hasValidator
            ? theme.mingCustomTheme()?.inputBlue ?? Colors.blue
            : outlineColor,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: theme.mingCustomTheme()?.inputRed ?? Colors.red,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: theme.mingCustomTheme()?.inputRed ?? Colors.red,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

class PostEditableContainer extends StatelessWidget {
  final String title;
  final String desc;
  final void Function()? onCancel;
  final void Function()? onSaveButtonClick;
  final Widget child;

  const PostEditableContainer({
    Key? key,
    required this.child,
    required this.title,
    required this.desc,
    this.onCancel,
    this.onSaveButtonClick,
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
              style: theme.textTheme.bodyMedium,
            ),
            const Spacer(),
            TextButton(
              onPressed: onCancel,
              child: Text(
                S.of(context).cancel,
                style: theme.textTheme.bodyMedium?.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        Text(
          desc,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: const Color(0xff949494),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        child,
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              textStyle: theme.textTheme.bodySmall,
              padding: const EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 18,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
          onPressed: onSaveButtonClick,
          child: Text(S.of(context).save),
        ),
      ],
    );
  }
}

class PostEditablePlainTextField extends StatefulWidget {
  final String title;
  final String desc;
  final String fieldTitle;
  final String? initialText;
  final Color outlineColor;
  final void Function()? onCancel;
  final FormFieldSetter? onSaved;
  final FormFieldValidator? validator;
  final void Function(String)? onChanged;

  const PostEditablePlainTextField({
    Key? key,
    required this.title,
    required this.desc,
    required this.fieldTitle,
    this.initialText,
    this.onCancel,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.outlineColor = const Color(0xffaaaaaa),
  }) : super(key: key);

  @override
  State<PostEditablePlainTextField> createState() =>
      _PostEditablePlainTextFieldState();
}

class _PostEditablePlainTextFieldState
    extends State<PostEditablePlainTextField> {
  final postEditableFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PostEditableContainer(
      title: widget.title,
      desc: widget.desc,
      onCancel: widget.onCancel,
      onSaveButtonClick: () {
        if (postEditableFormKey.currentState?.validate() ?? false) {
          postEditableFormKey.currentState?.save();
        }
      },
      child: Form(
        key: postEditableFormKey,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.always,
          style: theme.textTheme.bodyMedium,
          onSaved: widget.onSaved,
          onChanged: widget.onChanged,
          validator: widget.validator,
          initialValue: widget.initialText,
          decoration: _getFormFieldInputDecoration(
            context: context,
            labeText: widget.fieldTitle,
            outlineColor: widget.outlineColor,
            hasValidator: widget.validator != null,
          ),
        ),
      ),
    );
  }
}

// check: https://dev.to/curtlycritchlow/creating-a-dynamic-dropdown-form-field-in-flutter-100daysofcode-day-13-4pl1
class PostEditableDateField extends StatefulWidget {
  final String title;
  final String desc;
  final DateTime? initialDate;
  final Color outlineColor;
  final void Function()? onCancel;
  final void Function(DateTime date)? onSaved;
  final void Function(String)? onChanged;

  const PostEditableDateField({
    Key? key,
    required this.title,
    required this.desc,
    this.initialDate,
    this.outlineColor = const Color(0xffaaaaaa),
    this.onCancel,
    this.onSaved,
    this.onChanged,
  }) : super(key: key);

  @override
  State<PostEditableDateField> createState() => _PostEditableDateFieldState();
}

class _PostEditableDateFieldState extends State<PostEditableDateField> {
  late DateTime date;

  @override
  void initState() {
    super.initState();
    date = widget.initialDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    const double menuMaxheight = 200;

    return PostEditableContainer(
      title: widget.title,
      desc: widget.desc,
      onSaveButtonClick: () {
        widget.onSaved?.call(date);
      },
      onCancel: widget.onCancel,
      child: Row(
        children: List.generate(3, ((index) {
          String value;
          String label;
          List<DropdownMenuItem<String>> list;
          Function(String?) onChanged;

          switch (index) {
            case 0:
              {
                value = "${date.year}";
                label = S.of(context).year;
                list = DateDropDownMenuItemGenerator.getYearList(context);
                onChanged = (value) => setState(() {
                      date = date.copyWith(
                        year: int.parse(value!),
                      );
                    });
                break;
              }
            case 1:
              {
                value = "${date.month}";
                label = S.of(context).month;
                list = DateDropDownMenuItemGenerator.getMonthList(context);
                onChanged = (value) => setState(() {
                      date = date.copyWith(
                        month: int.parse(value!),
                      );
                    });
                break;
              }
            case 2:
              {
                value = "${date.day}";
                label = S.of(context).day;
                list = DateDropDownMenuItemGenerator.getDayList(
                  context,
                  date.year,
                  date.month,
                );
                onChanged = (value) => setState(() {
                      date = date.copyWith(
                        day: int.parse(value!),
                      );
                    });
                break;
              }
            default:
              throw Exception("date selection has wrong index. $index");
          }

          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: (index == 2 ? 0 : 5)),
              child: DropdownButtonFormField<String>(
                value: value,
                icon: const Icon(MingIcons.downArrow),
                iconEnabledColor: Colors.black,
                items: list,
                menuMaxHeight: menuMaxheight,
                focusColor: Colors.transparent,
                decoration: _getFormFieldInputDecoration(
                  context: context,
                  labeText: label,
                  outlineColor: widget.outlineColor,
                  hasValidator: false,
                ),
                onChanged: onChanged,
              ),
            ),
          );
        }), growable: false)
            .toList(),
      ),
    );
  }
}

class DateDropDownMenuItemGenerator {
  static List<DropdownMenuItem<String>> getYearList(
    BuildContext context, {
    int from = 100,
  }) {
    final today = DateTime.now().year;

    final yearList = List.generate(
      from,
      (index) => today - index,
      growable: false,
    );

    return _generateMenuItems(context, yearList);
  }

  static List<DropdownMenuItem<String>> getMonthList(BuildContext context) {
    final monthList = List.generate(12, (index) => index + 1, growable: false);

    return _generateMenuItems(context, monthList);
  }

  static List<DropdownMenuItem<String>> getDayList(
      BuildContext context, int year, int month) {
    const _daysInMonth = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    bool isLeapYear(int value) =>
        value % 400 == 0 || (value % 4 == 0 && value % 100 != 0);

    int daysInMonth(int year, int month) {
      var result = _daysInMonth[month];
      if (month == 2 && isLeapYear(year)) result++;
      return result;
    }

    return _generateMenuItems(
      context,
      List.generate(daysInMonth(year, month), (index) => index + 1,
          growable: false),
    );
  }

  static List<DropdownMenuItem<String>> _generateMenuItems(
      BuildContext context, List<int> list) {
    return list
        .map(
          (e) => DropdownMenuItem<String>(
            child: Text(
              "$e",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            value: "$e",
          ),
        )
        .toList();
  }
}

extension MyDateUtils on DateTime {
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }
}
