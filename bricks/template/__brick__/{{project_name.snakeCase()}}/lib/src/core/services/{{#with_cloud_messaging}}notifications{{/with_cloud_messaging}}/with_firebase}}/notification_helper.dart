import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:reinvest_mobile/core/router/router.dart' as r;
import 'package:url_launcher/url_launcher.dart';

class NotificationHelper {
  NotificationHelper._();

  static NotificationHelper instance = NotificationHelper._();

  void navigateToPage(RemoteMessage message) {
    //TODO notification navigation

    // try {
    //   print('${message.data}');
    //   // estate Details
    //   if (message.data['page_name'] == r.Route.estateDetails.name()) {
    //     r.navigator.to(
    //       r.Route.estateDetails.name(),
    //       queryParams: {
    //         'id': '${message.data['id']}',
    //       },
    //     );
    //   } else if (message.data['page_name'] ==
    //       r.Route.requestEstateDetails.name()) {
    //     // request Estate Details
    //     r.navigator.to(
    //       r.Route.requestEstateDetails.name(),
    //       queryParams: {
    //         'id': '${message.data['id']}',
    //       },
    //     );
    //   } else if (message.data['page_name'] ==
    //       r.Route.estateNewsDetails.name()) {
    //     // estate News Details
    //     r.navigator.to(
    //       r.Route.estateNewsDetails.name(),
    //       queryParams: {
    //         'slug': '${message.data['slug']}',
    //         'ignoreBlogId': '${message.data['ignore_blog_id']}',
    //       },
    //     );
    //   } else if (message.data['page_name'] == '/webView') {
    //     // Web View
    //     launchUrl(
    //       Uri.parse('${message.data['link']}'),
    //       mode: LaunchMode.inAppBrowserView,
    //     ).then((value) => r.navigator.toAndRemoveUntil(r.Route.home.name()));
    //   } else if (message.data['page_name'] == '/profile') {
    //     // profile
    //     r.navigator.to(r.Route.profile.name());
    //   } else if (message.data['page_name'] == '/nafath') {
    //     // nafath
    //     r.navigator.to(r.Route.nafath.name());
    //   } else if (message.data['page_name'] == '/add_estate_options') {
    //     // add estate options
    //     r.navigator.to(r.Route.addEstateOptions.name());
    //   } else if (message.data['page_name'] == '/request_estate') {
    //     // request estate
    //     r.navigator.to(r.Route.requestEstate.name());
    //   } else if (message.data['page_name'] == '/add_leave_to_us_estate') {
    //     // add leave to us estate
    //     r.navigator.to(r.Route.addLeaveToUsEstate.name());
    //   } else if (message.data['page_name'] == '/add_marketing_request') {
    //     // add marketing request
    //     r.navigator.to(r.Route.addMarketingRequest.name());
    //   } else if (message.data['page_name'] == '/fal') {
    //     // FAL
    //     r.navigator.to(r.Route.fal.name());
    //   }
    // } catch (e) {
    //   log('$e');
    // }
  }
}
