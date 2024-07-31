import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/core/res/media_res.dart';

class ChatCenterScreen extends StatelessWidget {
  const ChatCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.edit_square),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          color: context.theme.hoverColor,
          child: Column(
            children: [
              const SearchBar(
                hintText: 'Search for a chat',
                leading: Icon(Icons.search),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(MediaRes.defaultAvatar),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Adam',
                          style: context.theme.textTheme.labelSmall,
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: 7,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(MediaRes.defaultAvatar),
                        ),
                        title: Text('Adam'),
                        subtitle: Text('Hello, how are you?'),
                        trailing: Text('12:00'),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
