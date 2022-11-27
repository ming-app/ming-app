import 'package:flutter/material.dart';

class MingImageCard extends StatelessWidget {
  final ImageProvider<Object>? image;
  final Function()? onTap;
  final Widget? child;
  final bool isMobile;
  final double imageHeight;

  const MingImageCard({
    Key? key,
    this.onTap,
    this.image,
    this.child,
    this.isMobile = false,
    double? imageHeight,
  })  : this.imageHeight = imageHeight ?? 197,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? MingMobileImageCard(
            imageHeight: imageHeight,
            onTap: onTap,
            image: image,
            child: child,
          )
        : MingCard(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: imageHeight,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: image != null
                            ? Ink.image(
                                image: image!,
                                fit: BoxFit.cover,
                                child: Container(),
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
                child ?? Container(),
              ],
            ),
          );
  }
}

class MingCard extends StatefulWidget {
  final Function()? onTap;
  final Widget? child;

  const MingCard({
    Key? key,
    this.onTap,
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
            child: widget.child ?? Container(),
          ),
        ),
      ),
    );
  }
}

class MingMobileImageCard extends StatefulWidget {
  final ImageProvider<Object>? image;
  final Function()? onTap;
  final Widget? child;
  final double imageHeight;

  const MingMobileImageCard({
    Key? key,
    this.onTap,
    this.image,
    this.child,
    double? imageHeight,
  })  : this.imageHeight = imageHeight ?? 258,
        super(key: key);

  @override
  State<MingMobileImageCard> createState() => _MingMobileImageCardState();
}

class _MingMobileImageCardState extends State<MingMobileImageCard> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: widget.imageHeight,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: widget.image != null
                        ? Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: widget.image!, fit: BoxFit.cover),
                            ),
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
    );
  }
}
