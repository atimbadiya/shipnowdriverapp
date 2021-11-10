//
//  Chat.swift
//
//  Created by apple on 2/13/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverChatSendChat: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let sender = "sender"
    static let bookingId = "booking_id"
    static let driver = "driver"
    static let message = "message"
    static let timestamp = "timestamp"
    static let username = "username"
  }

  // MARK: Properties
  public var sender: String?
  public var bookingId: Int?
  public var driver: String?
  public var message: String?
  public var timestamp: Int?
  public var username: String?

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
    sender <- map[SerializationKeys.sender]
    bookingId <- map[SerializationKeys.bookingId]
    driver <- map[SerializationKeys.driver]
    message <- map[SerializationKeys.message]
    timestamp <- map[SerializationKeys.timestamp]
    username <- map[SerializationKeys.username]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = sender { dictionary[SerializationKeys.sender] = value }
    if let value = bookingId { dictionary[SerializationKeys.bookingId] = value }
    if let value = driver { dictionary[SerializationKeys.driver] = value }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = timestamp { dictionary[SerializationKeys.timestamp] = value }
    if let value = username { dictionary[SerializationKeys.username] = value }
    return dictionary
  }

}
