import '../models/header_models.dart';
import 'package:flutter/services.dart';
import '../models/complete_data.dart';
import '../models/feed.dart';


class Services {
  Future<ExploreData> completeData() async {
    final headings = await _getHeadings();
    final feed = await _getFeed();

    return ExploreData(headings, feed);
  }

  static Future<List<Header>> _getHeadings() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      final response = await _loadAsset('assets/horizontal_header.json');
      final List<Header> headings = headerFromJson(response);
      return headings;
    } catch (e) {
      return List<Header>.empty();
    }
  }

  static Future<List<Feed>> _getFeed() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      final response = await _loadAsset('assets/freinds_feed.json');
      final List<Feed> feed = feedFromJson(response);
      return feed;
    } catch (e) {
      return List<Feed>.empty();
    }
  }

  static Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
