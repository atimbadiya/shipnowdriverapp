//
//  Data.swift
//
//  Created by apple on 4/1/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct EmergencyContactData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let sosStatus = "sosStatus"
    static let updatedAt = "updated_at"
    static let id = "id"
    static let createdAt = "created_at"
    static let number = "number"
    static let merchantId = "merchant_id"
    static let name = "name"
    static let userId = "user_id"
  }

  // MARK: Properties
  public var sosStatus: Int?
  public var updatedAt: String?
  public var id: Int?
  public var createdAt: String?
  public var number: String?
  public var merchantId: Int?
    public var name: String?
    public var userId: Int?
    

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
    sosStatus <- map[SerializationKeys.sosStatus]
    updatedAt <- map[SerializationKeys.updatedAt]
    id <- map[SerializationKeys.id]
    createdAt <- map[SerializationKeys.createdAt]
    number <- map[SerializationKeys.number]
    merchantId <- map[SerializationKeys.merchantId]
    name <- map[SerializationKeys.name]
    userId <- map[SerializationKeys.userId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = sosStatus { dictionary[SerializationKeys.sosStatus] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = number { dictionary[SerializationKeys.number] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    return dictionary
  }

}
