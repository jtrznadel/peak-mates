import 'package:flutter/material.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';

class DestinationCard extends StatelessWidget {
  const DestinationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 200,
          height: 250,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/koscielec.jpg',
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.grayDarkColor.withOpacity(0.2),
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dolomites, 🇮🇹',
                    style: context.theme.textTheme.titleSmall,
                  ),
                  Text(
                    'The Dolomites are a mountain range lying in the eastern section of the northern Italian Alps. What makes these mountains so special is the fact that they are essentially composed of dolomite rock',
                    style: context.theme.textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
