//
//  User.swift
//
//  Created by apple on 2/13/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverDropChangeUser: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let userName = "UserName"
    static let userProfileImage = "UserProfileImage"
    static let email = "email"
    static let id = "id"
    static let rating = "rating"
    static let userPhone = "UserPhone"
  }

  // MARK: Properties
  public var userName: String?
  public var userProfileImage: String?
  public var email: String?
  public var id: Int?
  public var rating: String?
  public var userPhone: String?

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
    userName <- map[SerializationKeys.userName]
    userProfileImage <- map[SerializationKeys.userProfileImage]
    email <- map[SerializationKeys.email]
    id <- map[SerializationKeys.id]
    rating <- map[SerializationKeys.rating]
    userPhone <- map[SerializationKeys.userPhone]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = userName { dictionary[SerializationKeys.userName] = value }
    if let value = userProfileImage { dictionary[SerializationKeys.userProfileImage] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = rating { dictionary[SerializationKeys.rating] = value }
    if let value = userPhone { dictionary[SerializationKeys.userPhone] = value }
    return dictionary
  }

}
