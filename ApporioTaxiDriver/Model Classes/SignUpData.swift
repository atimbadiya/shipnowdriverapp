//
//  Data.swift
//
//  Created by apple on 2/3/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct SignUpData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let fullName = "fullName"
    static let id = "id"
    static let countryAreaId = "country_area_id"
    static let password = "password"
    static let createdAt = "created_at"
    static let email = "email"
    static let updatedAt = "updated_at"
    static let profileImage = "profile_image"
    static let driverGender = "driver_gender"
    static let phoneNumber = "phoneNumber"
    static let merchantId = "merchant_id"
    static let pushNotification = "push_notification"
  }

  // MARK: Properties
  public var fullName: String?
  public var id: Int?
  public var countryAreaId: String?
  public var password: String?
  public var createdAt: String?
  public var email: String?
  public var updatedAt: String?
  public var profileImage: String?
  public var driverGender: String?
  public var phoneNumber: String?
  public var merchantId: Int?
public var pushNotification: PushNotification?
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
    fullName <- map[SerializationKeys.fullName]
    id <- map[SerializationKeys.id]
    countryAreaId <- map[SerializationKeys.countryAreaId]
    password <- map[SerializationKeys.password]
    createdAt <- map[SerializationKeys.createdAt]
    email <- map[SerializationKeys.email]
    updatedAt <- map[SerializationKeys.updatedAt]
    profileImage <- map[SerializationKeys.profileImage]
    driverGender <- map[SerializationKeys.driverGender]
    phoneNumber <- map[SerializationKeys.phoneNumber]
    merchantId <- map[SerializationKeys.merchantId]
    pushNotification <- map[SerializationKeys.pushNotification]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = fullName { dictionary[SerializationKeys.fullName] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = countryAreaId { dictionary[SerializationKeys.countryAreaId] = value }
    if let value = password { dictionary[SerializationKeys.password] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = profileImage { dictionary[SerializationKeys.profileImage] = value }
    if let value = driverGender { dictionary[SerializationKeys.driverGender] = value }
    if let value = phoneNumber { dictionary[SerializationKeys.phoneNumber] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = pushNotification { dictionary[SerializationKeys.pushNotification] = value.dictionaryRepresentation() }
    return dictionary
  }

}
