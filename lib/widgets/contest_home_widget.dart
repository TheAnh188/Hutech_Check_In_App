import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/images.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/list_view_item.dart';

class ContestHomeWidget extends StatefulWidget {
  final String text;
  final String path;

  const ContestHomeWidget({
    super.key,
    required this.text,
    required this.path,
  });

  @override
  State<ContestHomeWidget> createState() => _ContestHomeWidgetState();
}

class _ContestHomeWidgetState extends State<ContestHomeWidget>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late AnimationController _clickController;
  late Animation<double> _clickAnimation;
  late bool _visible;

  @override
  void initState() {
    super.initState();
    _visible = true;

    _scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _scaleAnimation =
        Tween<double>(begin: 0.8, end: 1.0).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                _visible = false;
              });
              _scaleController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _scaleController.forward();
              setState(() {
                _visible = true;
              });
            }
          });
    _scaleController.forward();

    _clickController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _clickAnimation =
        Tween<double>(begin: 1.0, end: 0.97).animate(_clickController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _clickController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              Navigator.pushNamed(context, '/detail_contest_home');
            }
          });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ScaleTransition(
          scale: _clickAnimation,
          child: Transform.translate(
            offset: const Offset(-15, 0),
            child: TextButton.icon(
              onPressed: () {
                _clickController.forward();
              },
              style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
              icon: ScaleTransition(
                scale: _scaleAnimation,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1000),
                  opacity: _visible ? 1.0 : 0.4,
                  child: Icon(
                    MyIcons.fire,
                    color: MyColors.darkRed,
                    size: MySizes.size40SW,
                  ),
                ),
              ),
              label: Text(
                widget.text,
                style: MyTextStyles.content15MediumDarkRedSW,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: widget.path == Images.logo ? 16 / 6.5 : 16 / 9,
          child: ListViewItem(
            path: widget.path,
            boxFit: BoxFit.cover,
            // boxFit: null,
          ),
        ),
      ],
    );
  }
}
