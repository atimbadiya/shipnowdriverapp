//
//  Data.swift
//
//  Created by apple on 4/2/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct EmergencySosAddData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let application = "application"
    static let name = "name"
    static let updatedAt = "updated_at"
    static let id = "id"
    static let createdAt = "created_at"
    static let number = "number"
    static let userId = "user_id"
    static let merchantId = "merchant_id"
  }

  // MARK: Properties
  public var application: Int?
  public var name: String?
  public var updatedAt: String?
  public var id: Int?
  public var createdAt: String?
  public var number: String?
  public var userId: Int?
  public var merchantId: Int?

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
    application <- map[SerializationKeys.application]
    name <- map[SerializationKeys.name]
    updatedAt <- map[SerializationKeys.updatedAt]
    id <- map[SerializationKeys.id]
    createdAt <- map[SerializationKeys.createdAt]
    number <- map[SerializationKeys.number]
    userId <- map[SerializationKeys.userId]
    merchantId <- map[SerializationKeys.merchantId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = application { dictionary[SerializationKeys.application] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = number { dictionary[SerializationKeys.number] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    return dictionary
  }

}
