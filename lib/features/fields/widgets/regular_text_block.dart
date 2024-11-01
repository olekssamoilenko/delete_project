import 'package:flutter/material.dart';
import 'package:simple_grid/simple_grid.dart';

class RegularTextBlock extends StatelessWidget {
  const RegularTextBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SpGrid(
        width: MediaQuery.of(context).size.width,
        spacing: 10,
        runSpacing: 10,
        padding: const EdgeInsets.only(left: 40),
        children: [
          SpGridItem(
            xs: 12,
            md: 6,
            lg: 5,
            child: Text(
              'The main exception would be any kind of input, for which users can benefit from real-time feedback, such as password strength meter, or a choice of an available username, or the character count limit. There we need to respond to user’s input immediately, as not doing so would only slow down users desperately trying to find they way around system’s requirements.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
