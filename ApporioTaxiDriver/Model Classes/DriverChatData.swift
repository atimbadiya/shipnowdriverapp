//
//  Data.swift
//
//  Created by apple on 2/13/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverChatData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let chat = "chat"
    static let bookingId = "booking_id"
    static let updatedAt = "updated_at"
    static let id = "id"
    static let createdAt = "created_at"
  }

  // MARK: Properties
  public var chat: [DriverChatChat]?
  public var bookingId: String?
  public var updatedAt: String?
  public var id: Int?
  public var createdAt: String?

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
    chat <- map[SerializationKeys.chat]
    bookingId <- map[SerializationKeys.bookingId]
    updatedAt <- map[SerializationKeys.updatedAt]
    id <- map[SerializationKeys.id]
    createdAt <- map[SerializationKeys.createdAt]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = chat { dictionary[SerializationKeys.chat] = value.map { $0.dictionaryRepresentation() } }
    if let value = bookingId { dictionary[SerializationKeys.bookingId] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    return dictionary
  }

}
