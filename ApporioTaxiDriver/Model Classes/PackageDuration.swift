//
//  PackageDuration.swift
//
//  Created by Atul Jain on 22/10/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct PackageDuration: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let status = "status"
    static let sequence = "sequence"
    static let id = "id"
    static let updatedAt = "updated_at"
    static let createdAt = "created_at"
    static let merchantId = "merchant_id"
  }

  // MARK: Properties
  public var status: Int?
  public var sequence: Int?
  public var id: Int?
  public var updatedAt: String?
  public var createdAt: String?
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
    status <- map[SerializationKeys.status]
    sequence <- map[SerializationKeys.sequence]
    id <- map[SerializationKeys.id]
    updatedAt <- map[SerializationKeys.updatedAt]
    createdAt <- map[SerializationKeys.createdAt]
    merchantId <- map[SerializationKeys.merchantId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = sequence { dictionary[SerializationKeys.sequence] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    return dictionary
  }

}
