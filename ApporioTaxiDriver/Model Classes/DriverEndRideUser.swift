//
//  User.swift
//
//  Created by apple on 2/12/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverEndRideUser: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let userProfileImage = "UserProfileImage"
    static let totalTrips = "total_trips"
    static let id = "id"
    static let password = "password"
    static let userSignupType = "UserSignupType"
    static let manualUser = "manual_user"
    static let userStatus = "UserStatus"
    static let userName = "UserName"
    static let updatedAt = "updated_at"
    static let email = "email"
    static let rideOtp = "ride_otp"
    static let countyAreaId = "county_area_id"
    static let userSignupFrom = "UserSignupFrom"
    static let rating = "rating"
    static let userGender = "user_gender"
    static let merchantId = "merchant_id"
    static let phoneVerified = "PhoneVerified"
    static let referralCode = "ReferralCode"
    static let emailVerified = "EmailVerified"
    static let userPhone = "UserPhone"
    static let createdAt = "created_at"
    static let userType = "user_type"
    static let outstandingAmount = "outstanding_amount"
  }

  // MARK: Properties
  public var userProfileImage: String?
  public var totalTrips: String?
  public var id: Int?
  public var password: String?
  public var userSignupType: String?
  public var manualUser: String?
  public var userStatus: String?
  public var userName: String?
  public var updatedAt: String?
  public var email: String?
  public var rideOtp: String?
  public var countyAreaId: String?
  public var userSignupFrom: String?
  public var rating: String?
  public var userGender: String?
  public var merchantId: String?
  public var phoneVerified: String?
  public var referralCode: String?
  public var emailVerified: String?
  public var userPhone: String?
  public var createdAt: String?
  public var userType: String?
  public var outstandingAmount: String?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public init?(map: Map){

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public mutating func mapping(map: Map) {
    userProfileImage <- map[SerializationKeys.userProfileImage]
    totalTrips <- map[SerializationKeys.totalTrips]
    id <- map[SerializationKeys.id]
    password <- map[SerializationKeys.password]
    userSignupType <- map[SerializationKeys.userSignupType]
    manualUser <- map[SerializationKeys.manualUser]
    userStatus <- map[SerializationKeys.userStatus]
    userName <- map[SerializationKeys.userName]
    updatedAt <- map[SerializationKeys.updatedAt]
    email <- map[SerializationKeys.email]
    rideOtp <- map[SerializationKeys.rideOtp]
    countyAreaId <- map[SerializationKeys.countyAreaId]
    userSignupFrom <- map[SerializationKeys.userSignupFrom]
    rating <- map[SerializationKeys.rating]
    userGender <- map[SerializationKeys.userGender]
    merchantId <- map[SerializationKeys.merchantId]
    phoneVerified <- map[SerializationKeys.phoneVerified]
    referralCode <- map[SerializationKeys.referralCode]
    emailVerified <- map[SerializationKeys.emailVerified]
    userPhone <- map[SerializationKeys.userPhone]
    createdAt <- map[SerializationKeys.createdAt]
    userType <- map[SerializationKeys.userType]
    outstandingAmount <- map[SerializationKeys.outstandingAmount]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = userProfileImage { dictionary[SerializationKeys.userProfileImage] = value }
    if let value = totalTrips { dictionary[SerializationKeys.totalTrips] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = password { dictionary[SerializationKeys.password] = value }
    if let value = userSignupType { dictionary[SerializationKeys.userSignupType] = value }
    if let value = manualUser { dictionary[SerializationKeys.manualUser] = value }
    if let value = userStatus { dictionary[SerializationKeys.userStatus] = value }
    if let value = userName { dictionary[SerializationKeys.userName] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    if let value = rideOtp { dictionary[SerializationKeys.rideOtp] = value }
    if let value = countyAreaId { dictionary[SerializationKeys.countyAreaId] = value }
    if let value = userSignupFrom { dictionary[SerializationKeys.userSignupFrom] = value }
    if let value = rating { dictionary[SerializationKeys.rating] = value }
    if let value = userGender { dictionary[SerializationKeys.userGender] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = phoneVerified { dictionary[SerializationKeys.phoneVerified] = value }
    if let value = referralCode { dictionary[SerializationKeys.referralCode] = value }
    if let value = emailVerified { dictionary[SerializationKeys.emailVerified] = value }
    if let value = userPhone { dictionary[SerializationKeys.userPhone] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = userType { dictionary[SerializationKeys.userType] = value }
    if let value = outstandingAmount { dictionary[SerializationKeys.outstandingAmount] = value }
    return dictionary
  }

}
