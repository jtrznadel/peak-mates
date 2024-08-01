import 'package:flutter/material.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/core/res/string_res.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedButtonIndex = 0;

  void _onButtonPressed(int index) {
    setState(() {
      _selectedButtonIndex = index;
    });
  }

  Widget _getContent() {
    switch (_selectedButtonIndex) {
      case 0:
        return const Text('Screen 1');
      case 1:
        return const Text('Screen 2');
      case 2:
        return const Text('Screen 3');
      case 3:
        return const Text('Screen 4');
      default:
        return const Text('Select screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        actions: [
          TextButton.icon(
            onPressed: () {},
            label: const Text('Plan a trip'),
            icon: const Icon(
              Icons.route,
            ),
            iconAlignment: IconAlignment.end,
            style: TextButton.styleFrom(
              foregroundColor: context.theme.primaryColor,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SearchBar(
              hintText: StringRes.hintSearch,
              leading: Icon(
                Icons.search,
                color: context.theme.primaryColor,
              ),
              trailing: const [
                Icon(
                  Icons.filter_list,
                  color: AppColors.secondaryColor,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => _onButtonPressed(0),
                  style: TextButton.styleFrom(
                    foregroundColor: _selectedButtonIndex == 0
                        ? context.theme.primaryColor
                        : AppColors.grayLightColor,
                  ),
                  child: const Text('Trekking'),
                ),
                TextButton(
                  onPressed: () => _onButtonPressed(1),
                  style: TextButton.styleFrom(
                    foregroundColor: _selectedButtonIndex == 1
                        ? context.theme.primaryColor
                        : AppColors.grayLightColor,
                  ),
                  child: const Text('Hiking'),
                ),
                TextButton(
                  onPressed: () => _onButtonPressed(2),
                  style: TextButton.styleFrom(
                    foregroundColor: _selectedButtonIndex == 2
                        ? context.theme.primaryColor
                        : AppColors.grayLightColor,
                  ),
                  child: const Text('Climbing'),
                ),
                TextButton(
                  onPressed: () => _onButtonPressed(3),
                  style: TextButton.styleFrom(
                    foregroundColor: _selectedButtonIndex == 3
                        ? context.theme.primaryColor
                        : AppColors.grayLightColor,
                  ),
                  child: const Text('Camping'),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            _getContent()
          ],
        ),
      )),
    );
  }
}
