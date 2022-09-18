import 'package:flutter/material.dart';

class MingCard extends StatefulWidget {
  final ImageProvider<Object>? image;
  final Function()? onTap;
  final Widget? child;

  const MingCard({
    Key? key,
    this.onTap,
    this.image,
    this.child,
  }) : super(key: key);

  @override
  State<MingCard> createState() => _MingCardState();
}

class _MingCardState extends State<MingCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) => setState(() {
        isHover = value;
      }),
      hoverColor: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 262,
        child: Container(
          decoration: isHover
              ? BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0a1f1937),
                      offset: Offset(0, 10),
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: Color(0x141f1937),
                      offset: Offset(0, 20),
                      blurRadius: 25,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                )
              : null,
          child: Card(
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 197,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: widget.image != null
                            ? Ink.image(
                                image: widget.image!,
                                fit: BoxFit.cover,
                                child: Container(),
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
                widget.child ?? Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
