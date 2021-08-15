import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// GroupList
///
class GroupList extends StatelessWidget {
  final String title;
  final List<Widget> list;
  final Color titleColor;

  const GroupList({
    Key? key,
    required this.title,
    required this.list,
    this.titleColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 20.0, right: 8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
              ),
            ),
            Container(
              child: Column(
                children: list,
              ),
            )
          ],
        ),
      ),
    );
  }
}

///
/// GroupListColumn
///
class GroupListColumn extends StatelessWidget {
  final String title;
  final String? value;
  final IconData? iconData;
  final bool hasNext;
  final Function? onTap;
  final Color? titleColor;
  final IconData? valueIconData;
  final double? titlePaddingLeft;

  const GroupListColumn({
    Key? key,
    required this.title,
    this.value,
    this.iconData,
    this.hasNext = false,
    this.onTap,
    this.titleColor = Colors.black87,
    this.valueIconData,
    this.titlePaddingLeft = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.button,
      color: Colors.white.withOpacity(0.9),
      child: InkWell(
        onTap: () => onTap != null ? onTap!() : {},
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    iconData != null
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Icon(
                              iconData,
                              color: CupertinoColors.inactiveGray,
                              size: 25,
                            ),
                          )
                        : const SizedBox.shrink(),
                    Padding(
                      padding: EdgeInsets.only(left: titlePaddingLeft!),
                      child: Text(
                        title,
                        style: TextStyle(color: titleColor),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              hasNext
                  ? const Icon(
                      Icons.arrow_forward_ios,
                      color: CupertinoColors.inactiveGray,
                      size: 15,
                    )
                  : valueIconData != null
                      ? Icon(
                          valueIconData,
                          color: CupertinoColors.inactiveGray,
                          size: 20,
                        )
                      : value != null
                          ? Text(value!)
                          : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
