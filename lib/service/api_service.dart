// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';

import 'package:deals_on_map/service/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'api_client.dart';
import 'api_logs.dart';

class ApiService {
  static Future<String> getAccessToken() async {
    try {
      var instance = await SharedPreferences.getInstance();
      var token = instance.getString('access_token');
      Log.console("AccessToken$token");
      if (token == null) {
        return "";
      } else {
        return token;
      }
    } catch (e) {
      Log.console("Error(Function getAccessToken): $e");
      return '';
    }
  }

  ///loginApi
  static Future<http.Response> login(String mobile, String countryCode) async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.login, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'mobile': mobile,
      "country_code": countryCode,
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///registerApi
  static Future<http.Response> register(
    String mobile,
    String name,
    String email,
    String society,
    String tower,
    String flat,
    String address,
  ) async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.register, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'mobile': mobile,
      'name': name,
      'email': email,
      'society': society,
      'tower': tower,
      'flat': flat,
      'address': address,
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///otpVerifyApi
  static Future<http.Response> otpVerification(
    String mobile,
    String otp,
    String countryCode,
  ) async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.verifyOtp, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'mobile': mobile,
      'otp': otp,
      'country_code': countryCode,
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///societyListApi
  static Future<http.Response> societyListApi() async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.societyList, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///towerListApi
  static Future<http.Response> towerListApi(String societyId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('access_token');
    var result = await ApiClient.postData(ApiUrl.towerList, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'society_id': societyId
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///homeListApi
  static Future<http.Response> homeListApi() async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.homeApi, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///productListApi
  static Future<http.Response> productListApi(String categoryId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('access_token');
    var result = await ApiClient.postData(ApiUrl.productListApi, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'category_id': categoryId,
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///productDetails
  static Future<http.Response> productDetails(String productId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('access_token');
    var result = await ApiClient.postData(ApiUrl.productDetails, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'product_id': productId
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///getProfile
  static Future<http.Response> getProfile() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('access_token');
    var result = await ApiClient.postData(ApiUrl.getProfile, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///addCart
  static Future<http.Response> addCart(String productId, String quantity, String remove) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('access_token');
    var result = await ApiClient.postData(ApiUrl.addCart, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'product_id': productId,
      'quantity': quantity,
      'remove': remove,
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///cartList
  static Future<http.Response> cartList() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('access_token');
    var result = await ApiClient.postData(ApiUrl.cartListApi, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///updateCart
  static Future<http.Response> updateCart(String productId, String type) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('access_token');
    var result = await ApiClient.postData(ApiUrl.updateCart, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'product_id': productId,
      'type': type,
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///addWishListApi
  static Future<http.Response> addWishList(String productId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('access_token');
    var result = await ApiClient.postData(ApiUrl.addWishListApi, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'product_id': productId,
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///wishList
  static Future<http.Response> wishList() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('access_token');
    var result = await ApiClient.postData(ApiUrl.wishListApi, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///timeSlots
  static Future<http.Response> timeSlots() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('access_token');
    var result = await ApiClient.postData(ApiUrl.getTimeSlots, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///orderList
  static Future<http.Response> orderList(String deliveryStatus) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('access_token');
    var result = await ApiClient.postData(ApiUrl.orderList, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'delivery_status': deliveryStatus,
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///checkOut
  static Future<http.Response> checkOut(
    String deliveryName,
    String transactionId,
    String society,
    String tower,
    String flat,
    String address,
    String timeSlot,
    String paymentStatus,
    String paymentMethod,
    String amount,
    String gstAmount,
    String discount,
    String deliveryCharge,
    String totalAmount,
    String gstPer,
  ) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('access_token');
    var result = await ApiClient.postData(ApiUrl.saveOrder, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'delivery_name': deliveryName,
      'transaction_id': transactionId,
      'society': society,
      'tower': tower,
      'flat': flat,
      'address': address,
      'time_slot': timeSlot,
      'payment_status': paymentStatus,
      'payment_method': paymentMethod,
      'amount': amount,
      'gst_amount': gstAmount,
      'discount': discount,
      'delivery_charge': deliveryCharge,
      'total_amount': totalAmount,
      'gst_per': gstPer,
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///profileImage
  static Future<dynamic> profileImage(String profileImage) async {
    var result;
    http.Response response;
    try {
      var url = ApiUrl.updateProfileImg;
      Log.console('Http.Post Url: $url');
      var token = await getAccessToken();
      http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      Log.console('Http.Post Headers: ${request.headers}');
      if (profileImage.isNotEmpty) {
        http.MultipartFile file = await http.MultipartFile.fromPath('profile_image', profileImage);
        request.files.add(file);
      }
      Log.console('Http.Post filed: ${request.fields}');
      response = await http.Response.fromStream(await request.send());
      Log.console('Http.Response Body: ${response.body}');
      if (response.statusCode == 200) {
        result = jsonDecode(response.body);
      } else if (response.statusCode == 404) {
        result = {'status_code': 400, 'message': '404'};
      } else if (response.statusCode == 401) {
        result = jsonDecode(response.body);
      }
    } catch (e) {
      result = http.Response(
        jsonEncode({e.toString()}),
        204,
        headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'},
      );
    }
    return result;
  }

  static Future<http.Response> updateProfile(
    String name,
    String email,
    String gender,
    String dob,
    String whatsappNumber,
  ) async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.updateProfile, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'name': name,
      'email': email,
      'gender': gender,
      'date_of_birth': dob,
      'whatsapp_number': whatsappNumber,
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///cmsGet
  static Future<http.Response> cmsGet(String type) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('access_token');
    var result = await ApiClient.postData(ApiUrl.cmsPage, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      "type": type
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///contactUs
  static Future<http.Response> contactUs(String type) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('access_token');
    var result = await ApiClient.postData(ApiUrl.contactUs, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      "type": type
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///deleteAccount
  static Future<http.Response> deleteAccount() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('access_token');
    var result = await ApiClient.postData(ApiUrl.deleteAccount, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///notificationApi
  static Future<http.Response> notification() async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.notification, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///readNotificationApi
  static Future<http.Response> readNotification() async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.readNotification, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///readNotificationApi
  static Future<http.Response> couponList() async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.couponList, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// applyCoupon
  static Future<http.Response> applyCoupon(
    String amount,
    String couponCode,
    String isRemove,
  ) async {
    var token = await getAccessToken();
    http.Response response;
    var result = await ApiClient.postData(
      ApiUrl.couponApply,
      headers: {'Authorization': 'Bearer $token'},
      body: {
        'amount': amount,
        'coupon_code': couponCode,
        'remove': isRemove,
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///addressList
  static Future<http.Response> addressList() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('access_token');
    var result = await ApiClient.postData(ApiUrl.addressList, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///addAddress
  static Future<http.Response> addAddress(
    String name,
    String houseNumber,
    String mobile,
    String apartmentName,
    String address,
    String pincode,
    String city,
    String nearByLandmark,
    String addressType,
  ) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('access_token');
    var result = await ApiClient.postData(ApiUrl.addAddress, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'name': name,
      'house_number': houseNumber,
      'mobile': mobile,
      'apartment_name': apartmentName,
      'address': address,
      'pincode': pincode,
      'city': city,
      'near_by_landmark': nearByLandmark,
      'address_type': addressType,
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///deleteAddress
  static Future<http.Response> deleteAddress(String addressId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('access_token');
    var result = await ApiClient.postData(ApiUrl.deleteAddress, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'address_id': addressId,
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///selectAddress
  static Future<http.Response> selectAddress(String addressId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('access_token');
    var result = await ApiClient.postData(ApiUrl.selectAddress, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'address_id': addressId,
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }
}
