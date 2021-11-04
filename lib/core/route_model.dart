import 'package:flutter/material.dart';

class RouteModel extends ChangeNotifier {
  bool _isApplicationLoaded = false;
  bool _isQuotationLoaded = false;
  bool _isFeedbackLoaded = false;
  bool _isProviderLoaded = false;
  bool _isClaimLoaded = false;
  bool _isNearbyLoaded = false;
  bool _isProductsNServcesLoaded = false;
  bool _isContactUsLoaded = false;

  reset(){
isApplicationLoaded = false;
isQuotationLoaded = false;
isFeedbackLoaded = false;
isProviderLoaded = false;
isClaimLoaded = false;
isNearbyLoaded = false;
isProductsNServcesLoaded = false;
isContactUsLoaded = false;

  }

  get isContactUsLoaded => this._isContactUsLoaded;

  set isContactUsLoaded(value) {
    this._isContactUsLoaded = value;
    notifyListeners();
  }

  get isProductsNServcesLoaded => this._isProductsNServcesLoaded;

  set isProductsNServcesLoaded(value) {
    this._isProductsNServcesLoaded = value;
    notifyListeners();
  }

  bool get isApplicationLoaded => this._isApplicationLoaded;

  set isApplicationLoaded(bool value) {
    this._isApplicationLoaded = value;
    notifyListeners();
  }

  get isNearbyLoaded => this._isNearbyLoaded;

  set isNearbyLoaded(value) {
    this._isNearbyLoaded = value;
    notifyListeners();
  }

  get isProviderLoaded => this._isProviderLoaded;

  set isProviderLoaded(value) {
    this._isProviderLoaded = value;
    notifyListeners();
  }

  get isClaimLoaded => this._isClaimLoaded;

  set isClaimLoaded(value) {
    this._isClaimLoaded = value;
    notifyListeners();
  }

  get isFeedbackLoaded => this._isFeedbackLoaded;

  set isFeedbackLoaded(value) {
    this._isFeedbackLoaded = value;
    notifyListeners();
  }

  get isQuotationLoaded => this._isQuotationLoaded;

  set isQuotationLoaded(value) {
    this._isQuotationLoaded = value;
    notifyListeners();
  }
}
