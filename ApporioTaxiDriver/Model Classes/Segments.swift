//
//  Segments.swift
//
//  Created by Atul Jain on 25/07/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Segments: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let slag = "slag"
    static let icon = "icon"
    static let updatedAt = "updated_at"
    static let id = "id"
    static let name = "name"
    static let createdAt = "created_at"
    static let descriptionValue = "description"
  }

  // MARK: Properties
  public var slag: String?
  public var icon: String?
  public var updatedAt: String?
  public var id: Int?
  public var name: String?
  public var createdAt: String?
  public var descriptionValue: String?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public required init?(map: Map){

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
    public func mapping(map: Map) {
    slag <- map[SerializationKeys.slag]
    icon <- map[SerializationKeys.icon]
    updatedAt <- map[SerializationKeys.updatedAt]
    id <- map[SerializationKeys.id]
    name <- map[SerializationKeys.name]
    createdAt <- map[SerializationKeys.createdAt]
    descriptionValue <- map[SerializationKeys.descriptionValue]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = slag { dictionary[SerializationKeys.slag] = value }
    if let value = icon { dictionary[SerializationKeys.icon] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    return dictionary
  }

}
