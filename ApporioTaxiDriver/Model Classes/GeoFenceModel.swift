//
//  GeoFenceModel.swift
//
//  Created by Atul Jain on 19/12/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct GeoFenceModel: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let geofenceQueueText = "geofence_queue_text"
    static let geofenceQueueColor = "geofence_queue_color"
    static let message = "message"
    static let result = "result"
    static let type = "type"
  }

  // MARK: Properties
  public var geofenceQueueText: String?
  public var geofenceQueueColor: String?
  public var message: String?
  public var result: String?
     public var type: String?

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
    geofenceQueueText <- map[SerializationKeys.geofenceQueueText]
    geofenceQueueColor <- map[SerializationKeys.geofenceQueueColor]
    message <- map[SerializationKeys.message]
    result <- map[SerializationKeys.result]
    type <- map[SerializationKeys.type]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = geofenceQueueText { dictionary[SerializationKeys.geofenceQueueText] = value }
    if let value = geofenceQueueColor { dictionary[SerializationKeys.geofenceQueueColor] = value }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = result { dictionary[SerializationKeys.result] = value }
    if let value = type { dictionary[SerializationKeys.type] = value }
    return dictionary
  }

}
