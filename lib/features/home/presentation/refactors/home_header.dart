import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/core/res/string_res.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
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
      ],
    );
  }
}
