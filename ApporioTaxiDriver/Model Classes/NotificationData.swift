//
//  Data.swift
//
//  Created by Atul Jain on 01/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct NotificationData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let application = "application"
    static let updatedAt = "updated_at"
    static let id = "id"
    static let image = "image"
    static let createdAt = "created_at"
    static let title = "title"
    static let message = "message"
    static let driverId = "driver_id"
    static let userId = "user_id"
    static let url = "url"
    static let merchantId = "merchant_id"
  }

  // MARK: Properties
  public var application: String?
  public var updatedAt: String?
  public var id: Int?
  public var image: String?
  public var createdAt: String?
  public var title: String?
  public var message: String?
  public var driverId: String?
  public var userId: String?
  public var url: String?
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
    updatedAt <- map[SerializationKeys.updatedAt]
    id <- map[SerializationKeys.id]
    image <- map[SerializationKeys.image]
    createdAt <- map[SerializationKeys.createdAt]
    title <- map[SerializationKeys.title]
    message <- map[SerializationKeys.message]
    driverId <- map[SerializationKeys.driverId]
    userId <- map[SerializationKeys.userId]
    url <- map[SerializationKeys.url]
    merchantId <- map[SerializationKeys.merchantId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = application { dictionary[SerializationKeys.application] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = image { dictionary[SerializationKeys.image] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = driverId { dictionary[SerializationKeys.driverId] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    if let value = url { dictionary[SerializationKeys.url] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    return dictionary
  }

}
