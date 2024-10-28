import 'package:flutter/material.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:taha_debts/utils/constants/colors.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({super.key, required this.text, required this.selected, this.onSelected});

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    // final isColor = THelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        avatar: const TCircularContainer(width: 50, height: 50,),
        shape: const CircleBorder(),
        labelPadding: const EdgeInsets.all(0) ,
        padding: const EdgeInsets.all(0) ,
        // selectedColor: Colors.green,
        // backgroundColor: isColor ? THelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
