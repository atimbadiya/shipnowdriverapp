//
//  Holderpickdroplocationdata.swift
//
//  Created by Atul Jain on 20/02/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct RideDetailsHolderpickdroplocationdata: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let pickText = "pick_text"
    static let pickTextVisibility = "pick_text_visibility"
    static let dropText = "drop_text"
    static let dropTextVisibility = "drop_text_visibility"
    static let pick_latitude = "pick_lat"
    static let pick_longitude = "pick_lng"
    static let drop_latitude = "drop_lat"
    static let drop_longitude = "drop_lng"
  }

  // MARK: Properties
  public var pickText: String?
  public var pickTextVisibility: Bool? = false
    public var pick_latitude: String?
    public var pick_longitude: String?
  public var dropText: String?
  public var dropTextVisibility: Bool? = false
    public var drop_latitude: String?
    public var drop_longitude: String?

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
    pickText <- map[SerializationKeys.pickText]
    pickTextVisibility <- map[SerializationKeys.pickTextVisibility]
    dropText <- map[SerializationKeys.dropText]
    dropTextVisibility <- map[SerializationKeys.dropTextVisibility]
      pick_latitude <- map[SerializationKeys.pick_latitude]
      pick_longitude <- map[SerializationKeys.pick_longitude]
      drop_latitude <- map[SerializationKeys.drop_latitude]
      drop_longitude <- map[SerializationKeys.drop_longitude]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = pickText { dictionary[SerializationKeys.pickText] = value }
      if let value = pick_latitude { dictionary[SerializationKeys.pick_latitude] = value }
      if let value = pick_longitude { dictionary[SerializationKeys.pick_longitude] = value }
    dictionary[SerializationKeys.pickTextVisibility] = pickTextVisibility
    if let value = dropText { dictionary[SerializationKeys.dropText] = value }
      if let value = drop_latitude { dictionary[SerializationKeys.drop_latitude] = value }
      if let value = drop_longitude { dictionary[SerializationKeys.drop_longitude] = value }

    dictionary[SerializationKeys.dropTextVisibility] = dropTextVisibility
    return dictionary
  }
}
