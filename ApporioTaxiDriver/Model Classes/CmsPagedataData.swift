//
//  Data.swift
//
//  Created by apple on 2/7/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct CmsPagedataData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let application = "application"
    static let status = "status"
    static let updatedAt = "updated_at"
    static let slug = "slug"
    static let id = "id"
    static let createdAt = "created_at"
    static let descriptionValue = "description"
    static let title = "title"
    static let merchantId = "merchant_id"
  }

  // MARK: Properties
  public var application: String?
  public var status: String?
  public var updatedAt: String?
  public var slug: String?
  public var id: Int?
  public var createdAt: String?
  public var descriptionValue: String?
  public var title: String?
  public var merchantId: String?

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
    status <- map[SerializationKeys.status]
    updatedAt <- map[SerializationKeys.updatedAt]
    slug <- map[SerializationKeys.slug]
    id <- map[SerializationKeys.id]
    createdAt <- map[SerializationKeys.createdAt]
    descriptionValue <- map[SerializationKeys.descriptionValue]
    title <- map[SerializationKeys.title]
    merchantId <- map[SerializationKeys.merchantId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = application { dictionary[SerializationKeys.application] = value }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = slug { dictionary[SerializationKeys.slug] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    return dictionary
  }

}
