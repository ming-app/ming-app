import 'package:flutter/material.dart';
import 'package:ming/common/ming_icons.dart';

class PaginationBar extends StatelessWidget {
  final int pageNumber;
  final int totalPageNumber;
  final int maxPrintedNumber;
  final Function(int page)? onPageChanged;

  const PaginationBar({
    Key? key,
    required this.pageNumber,
    required this.totalPageNumber,
    this.maxPrintedNumber = 7,
    this.onPageChanged,
  }) : super(key: key);

  int calculatePageNumberByIndex(int idx) {
    if (idx == 0) return 0;
    if (totalPageNumber < maxPrintedNumber) return idx;
    if (idx == maxPrintedNumber - 1) return totalPageNumber - 1;

    bool closeToHead = false;
    bool closeToTail = false;

    if (pageNumber < maxPrintedNumber - 3) {
      // -1, ..., last number
      closeToHead = true;
    }

    if (totalPageNumber - pageNumber <= maxPrintedNumber - 2) {
      closeToTail = true;
    }

    if (!closeToHead && idx == 1) {
      return -1;
    }

    if (!closeToTail && idx == maxPrintedNumber - 2) {
      return -1;
    }

    if (closeToHead && closeToTail && idx == maxPrintedNumber - 2) {
      return -1;
    }

    if (!closeToTail && !closeToHead) {
      return pageNumber + (idx - ((maxPrintedNumber - 1) / 2) as int);
    }

    if (closeToHead) {
      return idx;
    }

    if (closeToTail) {
      return (totalPageNumber - 1) - (maxPrintedNumber - idx - 1);
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    var printedNumber =
        totalPageNumber < maxPrintedNumber ? totalPageNumber : maxPrintedNumber;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: pageNumber == 0
              ? null
              : () => onPageChanged?.call(pageNumber - 1),
          icon: Icon(MingIcons.leftArrow),
        ),
        Row(
          children: List.generate(printedNumber, (index) {
            var pageIdx = calculatePageNumberByIndex(index);
            var isSelected = pageIdx == pageNumber;
            var text = pageIdx == -1 ? "..." : (pageIdx + 1);

            return CircleAvatar(
              backgroundColor: isSelected ? Colors.black : Colors.transparent,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  onPageChanged?.call(pageIdx);
                },
                icon: Text(
                  "$text",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: isSelected ? Colors.white : null,
                      ),
                ),
              ),
            );
          }),
        ),
        IconButton(
          onPressed: pageNumber == totalPageNumber - 1
              ? null
              : () => onPageChanged?.call(pageNumber + 1),
          icon: Icon(MingIcons.rightArrow),
        ),
      ],
    );
  }
}
