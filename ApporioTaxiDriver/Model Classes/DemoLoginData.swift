//
//  Data.swift
//
//  Created by apple on 2/21/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DemoLoginData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let refreshToken = "refresh_token"
    static let accessToken = "access_token"
    static let pushNotification = "push_notification"
  }

  // MARK: Properties
  public var refreshToken: String?
  public var accessToken: String?
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
    refreshToken <- map[SerializationKeys.refreshToken]
    accessToken <- map[SerializationKeys.accessToken]
    pushNotification <- map[SerializationKeys.pushNotification]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = refreshToken { dictionary[SerializationKeys.refreshToken] = value }
    if let value = accessToken { dictionary[SerializationKeys.accessToken] = value }
     if let value = pushNotification { dictionary[SerializationKeys.pushNotification] = value.dictionaryRepresentation() }
    return dictionary
  }

}
