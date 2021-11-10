//
//  ActiveRides.swift
//
//  Created by Atul Jain on 20/02/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverHomeScreenActiveRides: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let bookingId = "booking_id"
    static let userProfileImage = "UserProfileImage"
    static let userName = "UserName"
    static let email = "email"
    static let id = "id"
    static let userPhone = "UserPhone"
    static let rideStatusColor = "ride_status_color"
    static let rideStatusText = "ride_status_text"
  }

  // MARK: Properties
  public var bookingId: String?
  public var userProfileImage: String?
  public var userName: String?
  public var email: String?
  public var id: Int?
  public var userPhone: String?
  public var rideStatusColor: String?
  public var rideStatusText: String?

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
    bookingId <- map[SerializationKeys.bookingId]
    userProfileImage <- map[SerializationKeys.userProfileImage]
    userName <- map[SerializationKeys.userName]
    email <- map[SerializationKeys.email]
    id <- map[SerializationKeys.id]
    userPhone <- map[SerializationKeys.userPhone]
    rideStatusColor <- map[SerializationKeys.rideStatusColor]
    rideStatusText <- map[SerializationKeys.rideStatusText]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = bookingId { dictionary[SerializationKeys.bookingId] = value }
    if let value = userProfileImage { dictionary[SerializationKeys.userProfileImage] = value }
    if let value = userName { dictionary[SerializationKeys.userName] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = userPhone { dictionary[SerializationKeys.userPhone] = value }
    if let value = rideStatusColor { dictionary[SerializationKeys.rideStatusColor] = value }
    if let value = rideStatusText { dictionary[SerializationKeys.rideStatusText] = value }
    return dictionary
  }

}
