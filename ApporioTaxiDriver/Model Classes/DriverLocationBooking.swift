//
//  Booking.swift
//
//  Created by Atul Jain on 14/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverLocationBooking: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let statusForPool = "status_for_pool"
    static let driverVerifyStatus = "driver_verify_status"
    static let bankName = "bank_name"
    static let termStatus = "term_status"
    static let lastRideRequestTimestamp = "last_ride_request_timestamp"
    static let freeBusy = "free_busy"
    static let currentLatitude = "current_latitude"
    static let lastName = "last_name"
    static let id = "id"
    static let playerId = "player_id"
    static let phoneNumber = "phoneNumber"
    static let rating = "rating"
    static let totalComanyEarning = "total_comany_earning"
    static let loginLogout = "login_logout"
    static let countryAreaId = "country_area_id"
    static let firstName = "first_name"
    static let createdAt = "created_at"
    static let onlineOffline = "online_offline"
    static let bearing = "bearing"
    static let expirePersonalDocument = "expire_personal_document"
    static let homeLocationActive = "home_location_active"
    static let profileImage = "profile_image"
    static let outstandAmount = "outstand_amount"
    static let totalTrips = "total_trips"
    static let password = "password"
    static let pendingDocumentStatus = "pending_document_status"
    static let signupStep = "signupStep"
    static let accountNumber = "account_number"
    static let email = "email"
    static let updatedAt = "updated_at"
    static let currentLongitude = "current_longitude"
    static let signupFrom = "signupFrom"
    static let driverAdminStatus = "driver_admin_status"
    static let driverGender = "driver_gender"
    static let accuracy = "accuracy"
    static let merchantId = "merchant_id"
    static let accountHolderName = "account_holder_name"
    static let poolRideActive = "pool_ride_active"
    static let countryArea = "country_area"
    static let totalEarnings = "total_earnings"
    static let expireVehicleDocument = "expire_vehicle_document"
    static let accessTokenId = "access_token_id"
    static let lastLocationUpdateTime = "last_location_update_time"
  }

  // MARK: Properties
  public var statusForPool: Int?
  public var driverVerifyStatus: Int?
  public var bankName: String?
  public var termStatus: Int?
  public var lastRideRequestTimestamp: String?
  public var freeBusy: Int?
  public var currentLatitude: String?
  public var lastName: String?
  public var id: Int?
  public var playerId: String?
  public var phoneNumber: String?
  public var rating: String?
  public var totalComanyEarning: String?
  public var loginLogout: Int?
  public var countryAreaId: Int?
  public var firstName: String?
  public var createdAt: String?
  public var onlineOffline: Int?
  public var bearing: String?
  public var expirePersonalDocument: Int?
  public var homeLocationActive: Int?
  public var profileImage: String?
  public var outstandAmount: String?
  public var totalTrips: Int?
  public var password: String?
  public var pendingDocumentStatus: Int?
  public var signupStep: Int?
  public var accountNumber: String?
  public var email: String?
  public var updatedAt: String?
  public var currentLongitude: String?
  public var signupFrom: Int?
  public var driverAdminStatus: Int?
  public var driverGender: Int?
  public var accuracy: String?
  public var merchantId: Int?
  public var accountHolderName: String?
  public var poolRideActive: Int?
  public var countryArea: DriverLocationCountryArea?
  public var totalEarnings: String?
  public var expireVehicleDocument: Int?
  public var accessTokenId: String?
  public var lastLocationUpdateTime: String?

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
    statusForPool <- map[SerializationKeys.statusForPool]
    driverVerifyStatus <- map[SerializationKeys.driverVerifyStatus]
    bankName <- map[SerializationKeys.bankName]
    termStatus <- map[SerializationKeys.termStatus]
    lastRideRequestTimestamp <- map[SerializationKeys.lastRideRequestTimestamp]
    freeBusy <- map[SerializationKeys.freeBusy]
    currentLatitude <- map[SerializationKeys.currentLatitude]
    lastName <- map[SerializationKeys.lastName]
    id <- map[SerializationKeys.id]
    playerId <- map[SerializationKeys.playerId]
    phoneNumber <- map[SerializationKeys.phoneNumber]
    rating <- map[SerializationKeys.rating]
    totalComanyEarning <- map[SerializationKeys.totalComanyEarning]
    loginLogout <- map[SerializationKeys.loginLogout]
    countryAreaId <- map[SerializationKeys.countryAreaId]
    firstName <- map[SerializationKeys.firstName]
    createdAt <- map[SerializationKeys.createdAt]
    onlineOffline <- map[SerializationKeys.onlineOffline]
    bearing <- map[SerializationKeys.bearing]
    expirePersonalDocument <- map[SerializationKeys.expirePersonalDocument]
    homeLocationActive <- map[SerializationKeys.homeLocationActive]
    profileImage <- map[SerializationKeys.profileImage]
    outstandAmount <- map[SerializationKeys.outstandAmount]
    totalTrips <- map[SerializationKeys.totalTrips]
    password <- map[SerializationKeys.password]
    pendingDocumentStatus <- map[SerializationKeys.pendingDocumentStatus]
    signupStep <- map[SerializationKeys.signupStep]
    accountNumber <- map[SerializationKeys.accountNumber]
    email <- map[SerializationKeys.email]
    updatedAt <- map[SerializationKeys.updatedAt]
    currentLongitude <- map[SerializationKeys.currentLongitude]
    signupFrom <- map[SerializationKeys.signupFrom]
    driverAdminStatus <- map[SerializationKeys.driverAdminStatus]
    driverGender <- map[SerializationKeys.driverGender]
    accuracy <- map[SerializationKeys.accuracy]
    merchantId <- map[SerializationKeys.merchantId]
    accountHolderName <- map[SerializationKeys.accountHolderName]
    poolRideActive <- map[SerializationKeys.poolRideActive]
    countryArea <- map[SerializationKeys.countryArea]
    totalEarnings <- map[SerializationKeys.totalEarnings]
    expireVehicleDocument <- map[SerializationKeys.expireVehicleDocument]
    accessTokenId <- map[SerializationKeys.accessTokenId]
    lastLocationUpdateTime <- map[SerializationKeys.lastLocationUpdateTime]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = statusForPool { dictionary[SerializationKeys.statusForPool] = value }
    if let value = driverVerifyStatus { dictionary[SerializationKeys.driverVerifyStatus] = value }
    if let value = bankName { dictionary[SerializationKeys.bankName] = value }
    if let value = termStatus { dictionary[SerializationKeys.termStatus] = value }
    if let value = lastRideRequestTimestamp { dictionary[SerializationKeys.lastRideRequestTimestamp] = value }
    if let value = freeBusy { dictionary[SerializationKeys.freeBusy] = value }
    if let value = currentLatitude { dictionary[SerializationKeys.currentLatitude] = value }
    if let value = lastName { dictionary[SerializationKeys.lastName] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = playerId { dictionary[SerializationKeys.playerId] = value }
    if let value = phoneNumber { dictionary[SerializationKeys.phoneNumber] = value }
    if let value = rating { dictionary[SerializationKeys.rating] = value }
    if let value = totalComanyEarning { dictionary[SerializationKeys.totalComanyEarning] = value }
    if let value = loginLogout { dictionary[SerializationKeys.loginLogout] = value }
    if let value = countryAreaId { dictionary[SerializationKeys.countryAreaId] = value }
    if let value = firstName { dictionary[SerializationKeys.firstName] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = onlineOffline { dictionary[SerializationKeys.onlineOffline] = value }
    if let value = bearing { dictionary[SerializationKeys.bearing] = value }
    if let value = expirePersonalDocument { dictionary[SerializationKeys.expirePersonalDocument] = value }
    if let value = homeLocationActive { dictionary[SerializationKeys.homeLocationActive] = value }
    if let value = profileImage { dictionary[SerializationKeys.profileImage] = value }
    if let value = outstandAmount { dictionary[SerializationKeys.outstandAmount] = value }
    if let value = totalTrips { dictionary[SerializationKeys.totalTrips] = value }
    if let value = password { dictionary[SerializationKeys.password] = value }
    if let value = pendingDocumentStatus { dictionary[SerializationKeys.pendingDocumentStatus] = value }
    if let value = signupStep { dictionary[SerializationKeys.signupStep] = value }
    if let value = accountNumber { dictionary[SerializationKeys.accountNumber] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = currentLongitude { dictionary[SerializationKeys.currentLongitude] = value }
    if let value = signupFrom { dictionary[SerializationKeys.signupFrom] = value }
    if let value = driverAdminStatus { dictionary[SerializationKeys.driverAdminStatus] = value }
    if let value = driverGender { dictionary[SerializationKeys.driverGender] = value }
    if let value = accuracy { dictionary[SerializationKeys.accuracy] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = accountHolderName { dictionary[SerializationKeys.accountHolderName] = value }
    if let value = poolRideActive { dictionary[SerializationKeys.poolRideActive] = value }
    if let value = countryArea { dictionary[SerializationKeys.countryArea] = value.dictionaryRepresentation() }
    if let value = totalEarnings { dictionary[SerializationKeys.totalEarnings] = value }
    if let value = expireVehicleDocument { dictionary[SerializationKeys.expireVehicleDocument] = value }
    if let value = accessTokenId { dictionary[SerializationKeys.accessTokenId] = value }
    if let value = lastLocationUpdateTime { dictionary[SerializationKeys.lastLocationUpdateTime] = value }
    return dictionary
  }

}
