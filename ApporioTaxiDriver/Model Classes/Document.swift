//
//  Document.swift
//
//  Created by Gyanender on 15/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct Document: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let updatedAt = "updated_at"
    static let id = "id"
    static let documentStatus = "documentStatus"
    static let expireDate = "expire_date"
    static let createdAt = "created_at"
    static let documentNeed = "documentNeed"
    static let merchantId = "merchant_id"
  }

  // MARK: Properties
  public var updatedAt: String?
  public var id: Int?
  public var documentStatus: Int?
  public var expireDate: Int?
  public var createdAt: String?
  public var documentNeed: Int?
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
    updatedAt <- map[SerializationKeys.updatedAt]
    id <- map[SerializationKeys.id]
    documentStatus <- map[SerializationKeys.documentStatus]
    expireDate <- map[SerializationKeys.expireDate]
    createdAt <- map[SerializationKeys.createdAt]
    documentNeed <- map[SerializationKeys.documentNeed]
    merchantId <- map[SerializationKeys.merchantId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = documentStatus { dictionary[SerializationKeys.documentStatus] = value }
    if let value = expireDate { dictionary[SerializationKeys.expireDate] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = documentNeed { dictionary[SerializationKeys.documentNeed] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    return dictionary
  }

}
