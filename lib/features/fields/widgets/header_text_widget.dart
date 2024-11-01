import 'package:flutter/material.dart';
import 'package:simple_grid/simple_grid.dart';

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpGrid(
          width: MediaQuery.of(context).size.width,
          spacing: 10,
          runSpacing: 10,
          padding: const EdgeInsets.only(left: 40),
          children: [
            SpGridItem(
              xs: 12,
              md: 6,
              lg: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Inputs:',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400, fontSize: 32),
                        ),
                        TextSpan(
                          text: ' Late validation',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 32),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'As users are typing, any kind of distraction in such environments is highly unwanted and counter-productive. In fact, distraction often leads to even more errors, but also reduced accuracy of data and increased completion times.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Late validation almost always performs better. It’s just that by validating late, we can be more confident that the user isn’t still in the process of typing the data in the input field.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
