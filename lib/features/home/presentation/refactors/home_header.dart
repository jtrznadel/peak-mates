import 'package:flutter/material.dart';
import 'package:peak_mates/core/res/string_res.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: StringRes.hintSearch,
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.all(10),
            suffixIcon: Icon(Icons.filter_list),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide.none,
            ),
            filled: true,
          ),
        ),
      ],
    );
  }
}
