import 'package:case_app/core/pages.dart';
import 'package:case_app/core/service_locator.dart';
import 'package:case_app/screens/choice_form.dart';
import 'package:case_app/screens/contact_us.dart';
import 'package:case_app/screens/forms/aplication_form_pages/application_form.dart';
import 'package:case_app/screens/forms/claim.dart';
import 'package:case_app/screens/forms/feedback_and_inquiries.dart';
import 'package:case_app/screens/forms/quotation_forms/quotation_request.dart';
import 'package:case_app/screens/near_me.dart';
import 'package:case_app/screens/products_and_services.dart';
import 'package:case_app/screens/provider_network.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'route_model.dart';

class MyRouterDelegate extends RouterDelegate
    with PopNavigatorRouterDelegateMixin, ChangeNotifier {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    final model = context.watch<RouteModel>();
    return Navigator(
      pages: [
        MyPage(ChoiceForm()),
        if (model.isApplicationLoaded)
          MyPage(ApplicationForm())
        else if (model.isClaimLoaded)
          MyPage(ClaimForm())
        else if (model.isFeedbackLoaded)
          MyPage(FeedbackInquiries())
        else if (model.isProductsNServcesLoaded)
          MyPage(ProductAndServices())
        else if (model.isQuotationLoaded)
          MyPage(QuotationRequest())
        else if (model.isNearbyLoaded)
          MyPage(NearMe())
        else if (model.isContactUsLoaded)
          MyPage(ContactUs())
        else if (model.isProviderLoaded)
          MyPage(ProviderNetwork()),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        model.reset();
        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }
}
