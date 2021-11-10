//
//  ServiceType.swift
//
//  Created by Atul Jain on 14/10/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct ServiceType: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let serviceName = "serviceName"
    static let icon = "icon"
    static let id = "id"
    static let colour = "colour"
  }

  // MARK: Properties
  public var serviceName: String?
  public var icon: String?
  public var id: Int?
  public var colour: String?

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
    serviceName <- map[SerializationKeys.serviceName]
    icon <- map[SerializationKeys.icon]
    id <- map[SerializationKeys.id]
    colour <- map[SerializationKeys.colour]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = serviceName { dictionary[SerializationKeys.serviceName] = value }
    if let value = icon { dictionary[SerializationKeys.icon] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = colour { dictionary[SerializationKeys.colour] = value }
    return dictionary
  }

}
