import 'package:flutter/material.dart';
import 'package:peak_mates/features/home/presentation/widgets/destination_card.dart';
import 'package:peak_mates/features/home/presentation/widgets/heading_see_all.dart';
import 'package:peak_mates/features/home/presentation/widgets/nearby_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HeadingSeeAll(
              heading: 'Upcoming trip ⏳',
            ),
            //TODO: Implement UpcomingTripWidget
            const HeadingSeeAll(
              heading: 'Trending 🔥',
            ),
            SizedBox(
              height: 250,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const DestinationCard(),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 5,
                ),
                itemCount: 5,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const HeadingSeeAll(heading: 'Nearby Trips'),
            SizedBox(
              height: 200,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const NearbyCard(),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 5,
                ),
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
