import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nytimes_app/domain/nyt_story.dart';
import 'package:url_launcher/url_launcher.dart';
import 'components/styles.dart';
import 'components/appbar.dart';

class Details extends StatelessWidget {
  const Details({
    Key key,
    @required this.story,
  }) : super(key: key);

  final NYTStory story;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: DetailsAppBar(story),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (story.imageBigUrl != null)
                // Cache image to increase response of the App
                CachedNetworkImage(
                  imageUrl: story.imageBigUrl,
                  fadeInCurve: Curves.easeIn,
                ),
              Container(
                padding: titleAbstractPadding,
                child: Text(
                  story.title,
                  style: titleTextStyle,
                ),
              ),
              if (story.abstractText != null)
                Container(
                  padding: titleAbstractPadding,
                  child: Text(
                    story.abstractText,
                    style: abstractTextStyle,
                  ),
                ),
              Container(
                padding: dateUrlPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      story.publishedDate,
                      style: dateTextStyle,
                    ),
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.externalLinkAlt,
                        size: 30.0,
                        color: Colors.black,
                      ),
                      onPressed: () async {
                        // Open URL
                        if (await canLaunch(story.url)) {
                          await launch(story.url);
                        } else {
                          throw 'Could not launch ${story.url}';
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
