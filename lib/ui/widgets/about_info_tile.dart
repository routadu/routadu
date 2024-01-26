import 'package:flutter/material.dart';
import 'package:portfolio/models/about_info_tile_data/about_info_tile_data.dart';
import 'dart:html' as html;

class AboutInfoTile extends StatelessWidget {
  final AboutInfoTileData data;

  const AboutInfoTile({super.key, required this.data});

  void openLink() {
    html.window.open(data.link ?? "", 'new tab');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          data.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        subtitle: Text(
          data.tertiaryText == null
              ? data.secondaryText
              : "${data.secondaryText}\n${data.tertiaryText!}",
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
        isThreeLine: data.tertiaryText != null,
        trailing: data.link != null
            ? IconButton(
                onPressed: openLink,
                icon: const Icon(Icons.open_in_new_outlined))
            : null,
      ),
    );
  }
}
