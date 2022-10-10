import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class ContactToShelterButton extends StatelessWidget {
  final Function()? onClick;

  const ContactToShelterButton({
    Key? key,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 300,
        ),
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).shelterContact),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 0),
                      backgroundColor: Color(0xffda4d2e),
                      foregroundColor: Colors.white,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      padding: EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  onPressed: onClick,
                  child: Text(
                    S.of(context).contact,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
