import 'package:flutter/material.dart';

import '../../../../../../domin/entity/SourcesResponseEntity.dart';

class TapItem2 extends StatelessWidget {
  final bool isSelected;
  final SourcesEntity? sourceEntity;

  const TapItem2(
      {super.key, required this.isSelected, required this.sourceEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 1),
          borderRadius: BorderRadius.circular(15),
          color: isSelected ? Colors.red : Colors.transparent),
      child: Text(
        sourceEntity?.name ?? 'Unknown',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: isSelected ? Colors.white : Colors.green, fontSize: 18),
      ),
    );
  }
}
