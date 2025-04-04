// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';

import 'package:deals_on_map/service/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_client.dart';
import 'api_logs.dart';

class ApiService {
  static Future<String> getAccessToken() async {
    try {
      var instance = await SharedPreferences.getInstance();
      var token = instance.getString('access_token');
      Log.console("AccessToken $token");
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

  static Future<http.Response> login(String mobile, String countryCode) async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.login, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'mobileNumber': mobile,
      "country_code": countryCode,
    });
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
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
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  ///otpVerifyApi
  static Future<http.Response> otpVerification(
    String mobile,
    String otp,
    String countryCode,
  ) async {
    http.Response response;

    var result = await ApiClient.postData(ApiUrl.verifyOtp, body: {
      'country_code': countryCode,
      'mobileNumber': mobile,
      'otp': otp,
    });
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

// fetch business categories
  static Future<http.Response> businessCategoryList() async {
    http.Response response;
    var result = await ApiClient.getData(ApiUrl.businessCategoryList);
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

// fetch business services
  static Future<http.Response> businessCategoryServicesList(
      String catID) async {
    final String apiUrl =
        "${ApiUrl.businessCategoryServicesList}?business_category_id=$catID";
    http.Response response;
    var result = await ApiClient.getData(apiUrl);
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  /// countries list

  // static Future<http.Response> countryList() async {
  //   http.Response response;
  //   var instance = await SharedPreferences.getInstance();
  //   var token = instance.getString('access_token');
  //   var result = await ApiClient.postData(ApiUrl.contactUs, headers: {
  //     'Authorization': 'Bearer $token',
  //     "Accept": "application/json",
  //   }, body: {});
  //   response = http.Response(jsonEncode(result), 200, headers: {
  //     HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
  //   });
  //   return response;
  // }

  // static Future<http.Response> countryList() async {
  //   http.Response response;
  //   var result = await ApiClient.getData(ApiUrl.countryList);
  //   response = http.Response(jsonEncode(result), 200, headers: {
  //     HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
  //   });
  //   return response;
  // }

  /// state list
  static Future<http.Response> stateList(String country) async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.contactUs, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  /// city list
  static Future<http.Response> cityList(String state) async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.contactUs, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  /// seller Reg otp sent
  static Future<http.Response> sellerRegOtp(
    var services, {
    required String businessName,
    required String businessOwnerName,
    required String businessType,
    required String websiteLink,
    required String businessCategoryId,
    required String gstNumber,
    required String panCardNumber,
    required String countryId,
    required String stateId,
    required String cityId,
    required String address,
    required String pincode,
    required String sellerMobile,
    required String countryCode,
    required String isAlreadyVerify,
  }) async {
    http.Response response;
    var token = await getAccessToken();
    Map<String, String> requestBody = {
      "business_name": businessName,
      "business_owner_name": businessOwnerName,
      "business_type": businessType,
      "website_link": websiteLink,
      "business_category_id": businessCategoryId,
      "gst_number": gstNumber,
      "pan_card_number": panCardNumber,
      "country_id": countryId,
      "state_id": stateId,
      "city_id": cityId,
      "address": address,
      "pincode": pincode,
      "seller_mobile": sellerMobile,
      "country_code": countryCode,
      "is_verify": isAlreadyVerify,
    };
    for (int i = 0; i < services.length; i++) {
      requestBody['services[$i]'] = services[i];
    }
    var result = await ApiClient.postData(
      ApiUrl.sellerReg,
      headers: {
        'Authorization': 'Bearer $token',
        "Accept": "application/json",
      },
      body: requestBody,
    );
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  static Future<http.Response> sellerRegVerify(
    var services, {
    required String businessName,
    required String businessOwnerName,
    required String businessType,
    required String websiteLink,
    required String businessCategoryId,
    required String gstNumber,
    required String panCardNumber,
    required String countryId,
    required String stateId,
    required String cityId,
    required String address,
    required String pincode,
    required String sellerMobile,
    required String countryCode,
    required String isAlreadyVerify,
    required String otp,
  }) async {
    http.Response response;
    var token = await getAccessToken();
    Map<String, String> requestBody = {
      "business_name": businessName,
      "business_owner_name": businessOwnerName,
      "business_type": businessType,
      "website_link": websiteLink,
      "business_category_id": businessCategoryId,
      "gst_number": gstNumber,
      "pan_card_number": panCardNumber,
      "country_id": countryId,
      "state_id": stateId,
      "city_id": cityId,
      "address": address,
      "pincode": pincode,
      "seller_mobile": sellerMobile,
      "country_code": countryCode,
      "is_verify": isAlreadyVerify,
      "otp": otp,
    };
    for (int i = 0; i < services.length; i++) {
      requestBody['services[$i]'] = services[i];
    }
    var result = await ApiClient.postData(
      ApiUrl.sellerReg,
      headers: {
        'Authorization': 'Bearer $token',
        "Accept": "application/json",
      },
      body: requestBody,
    );
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

// seller reg otp verify

  ///societyListApi
  static Future<http.Response> societyListApi() async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.societyList, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  ///towerListApi
  static Future<http.Response> towerListApi(String societyId) async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.towerList, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'society_id': societyId
    });
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  ///homeListApi
  static Future<http.Response> homeListApi() async {
    http.Response response;
    // var token = await getAccessToken();
    var result = await ApiClient.getData(ApiUrl.homeApi, headers: {
      // 'Authorization': 'Bearer $token',
      // "Accept": "application/json",
    });
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  ///productListApi
  static Future<http.Response> productListApi(String categoryId) async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.productListApi, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'category_id': categoryId,
    });
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  ///productDetails
  static Future<http.Response> productDetails(String productId) async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.productDetails, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'product_id': productId
    });
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  ///getProfile
  static Future<http.Response> getProfile() async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.getProfile, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  ///addCart
  static Future<http.Response> addCart(
      String productId, String quantity, String remove) async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.addCart, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'product_id': productId,
      'quantity': quantity,
      'remove': remove,
    });
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  ///cartList
  static Future<http.Response> cartList() async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.cartListApi, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  ///updateCart
  static Future<http.Response> updateCart(String productId, String type) async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.updateCart, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'product_id': productId,
      'type': type,
    });
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  ///addWishListApi
  static Future<http.Response> addWishList(String productId) async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.addWishListApi, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'product_id': productId,
    });
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  ///wishList
  static Future<http.Response> wishList() async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.wishListApi, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  ///timeSlots
  static Future<http.Response> timeSlots() async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.getTimeSlots, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  ///orderList
  static Future<http.Response> orderList(String deliveryStatus) async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.orderList, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'delivery_status': deliveryStatus,
    });
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
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
    var token = await getAccessToken();
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
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
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
      http.MultipartRequest request =
          http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      Log.console('Http.Post Headers: ${request.headers}');
      if (profileImage.isNotEmpty) {
        http.MultipartFile file =
            await http.MultipartFile.fromPath('profile_image', profileImage);
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
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
        },
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
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  ///cmsGet
  static Future<http.Response> cmsGet(String type) async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.cmsPage, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      "type": type
    });
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  ///contactUs
  static Future<http.Response> contactUs(String type) async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.contactUs, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      "type": type
    });
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  ///deleteAccount
  static Future<http.Response> deleteAccount() async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.deleteAccount, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
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
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
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
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
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
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
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
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  ///addressList
  static Future<http.Response> addressList() async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.addressList, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
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
    var token = await getAccessToken();
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
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  ///deleteAddress
  static Future<http.Response> deleteAddress(String addressId) async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.deleteAddress, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'address_id': addressId,
    });
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  ///selectAddress
  static Future<http.Response> selectAddress(String addressId) async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(ApiUrl.selectAddress, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    }, body: {
      'address_id': addressId,
    });
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  /// seller dashboard
  static Future<http.Response> sellerDashboard() async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.postData(
      ApiUrl.sellerDashboard,
      headers: {
        'Authorization': 'Bearer $token',
        "Accept": "application/json",
      },
      body: {},
    );
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  /// Create Shop Offer
  static Future<http.Response> createShopOffer(
    List<File> images,
    String title,
    String description,
  ) async {
    var token = await getAccessToken();
    Map<String, String> requestBody = {
      "title": title,
      "description": description,
    };
    var result = await ApiService.uploadMultiPalImages(
      token: token,
      url: ApiUrl.createShopOffer,
      image: images,
      filed: 'files',
      body: requestBody,
      isSingle: false,
      singleImage: File(""),
    );
    if (result.statusCode == 200 || result.statusCode == 201) {
      return result;
    } else {
      Log.console("Something went wrong! Please try again.");
      return http.Response("Request failed with status: ${result.statusCode}",
          result.statusCode);
    }
  }

  // delete shop offer
  static Future<http.Response> deleteShopOffer(int offerID) async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.getData(
        "${ApiUrl.deleteShopOffer}?offer_id=$offerID",
        headers: {
          'Authorization': 'Bearer $token',
          "Accept": "application/json",
        });
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  // update shop offer
  static Future<http.Response> updateShopOffer(
    List<File> images,
    String title,
    String description,
    String offerID,
    List<String> deleteImagesId, // ✅ Only contains IDs, not URLs
  ) async {
    var token = await getAccessToken();

    Map<String, String> requestBody = {
      "title": title,
      "description": description,
      "offer_id": offerID,
    };

    // ✅ Ensure only numeric image IDs are sent (Not URLs)
    if (deleteImagesId.isNotEmpty) {
      for (int i = 0; i < deleteImagesId.length; i++) {
        requestBody['delete_image_id[$i]'] = deleteImagesId[i];
      }
    }

    try {
      var result = await ApiService.uploadMultiPalImages(
        token: token,
        url: ApiUrl.updateShopOffer,
        image: images,
        filed: 'files',
        body: requestBody,
        isSingle: false,
      );

      Log.console("Response Status: ${result.statusCode}");
      Log.console("Response Body: ${result.body}");

      if (result.statusCode == 200 || result.statusCode == 201) {
        return result;
      } else {
        Log.console("Error: API request failed.");
        return http.Response(
          "Request failed with status: ${result.statusCode}",
          result.statusCode,
        );
      }
    } catch (e) {
      Log.console("Exception in updateShopOffer: $e");
      return http.Response("Exception: ${e.toString()}", 500);
    }
  }

  //shop offer list
  static Future<http.Response> shopOfferList() async {
    http.Response response;
    var token = await getAccessToken();
    var result = await ApiClient.getData(ApiUrl.shopOfferList, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    });
    response = http.Response(jsonEncode(result), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
    return response;
  }

  static Future<http.Response> uploadMultiPalImages({
    required String token,
    required String url,
    required bool isSingle,
    required String filed,
    required List<File> image,
    File? singleImage,
    required Map<String, String> body,
  }) async {
    try {
      var headers = {
        'Connection': "keep-alive",
        'Authorization': 'Bearer $token',
      };

      var request = http.MultipartRequest('POST', Uri.parse(url));

      if (isSingle && singleImage != null) {
        String? mimeType = lookupMimeType(singleImage.path);
        List<String> mimeTypeData =
            mimeType?.split('/') ?? ['application', 'octet-stream'];

        request.files.add(
          await http.MultipartFile.fromPath(
            filed,
            singleImage.path,
            contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
          ),
        );
      } else {
        for (var img in image) {
          String? mimeType =
              lookupMimeType(img.path) ?? 'application/octet-stream';
          List<String> mimeTypeData = mimeType.split('/');

          request.files.add(
            await http.MultipartFile.fromPath(
              filed,
              img.path,
              contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
            ),
          );
        }
      }

      request.fields.addAll(body);
      request.headers.addAll(headers);

      http.StreamedResponse streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      Log.console(
        '🔵 API Request: $url\n'
        '📩 Headers: $headers\n'
        '📤 Body: ${request.fields}\n'
        '🖼️ Uploaded Files: ${request.files.length}\n'
        '📥 Response: ${response.statusCode}\n'
        '📄 Body: ${response.body}',
      );

      return response;
    } catch (e, stackTrace) {
      Log.console("❌ Error in $url: $e \n StackTrace: $stackTrace");

      rethrow;
    }
  }

  /// seller business upload
  static Future<http.Response> sellerBusinessUpload() async {
    var result;
    http.Response response;
    try {
      var url = ApiUrl.sellerBussinessUpload;
      Log.console('Http.Post Url: $url');
      var token = await getAccessToken();

      http.MultipartRequest request =
          http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      Log.console('Http.Post Headers: ${request.headers}');
      // if (selectedImg.isNotEmpty) {
      //   http.MultipartFile file =
      //   await http.MultipartFile.fromPath('files', selectedImg[0].path);
      //   request.files.add(file);
      // }
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
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
        },
      );
    }
    return result;
  }
}
