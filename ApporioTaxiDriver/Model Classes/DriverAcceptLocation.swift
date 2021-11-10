//
//  Location.swift
//
//  Created by apple on 2/9/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverAcceptLocation: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let locationAction = "location_action"
    static let locationColor = "location_color"
    static let locationText = "location_text"
    static let locationEditable = "location_editable"
    static let tripStatusText = "trip_status_text"
    static let locationHeadline = "location_headline"
  }

  // MARK: Properties
  public var locationAction: Bool? = false
  public var locationColor: String?
  public var locationText: String?
  public var locationEditable: Bool? = false
  public var tripStatusText: String?
  public var locationHeadline: String?

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
    locationAction <- map[SerializationKeys.locationAction]
    locationColor <- map[SerializationKeys.locationColor]
    locationText <- map[SerializationKeys.locationText]
    locationEditable <- map[SerializationKeys.locationEditable]
    tripStatusText <- map[SerializationKeys.tripStatusText]
    locationHeadline <- map[SerializationKeys.locationHeadline]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.locationAction] = locationAction
    if let value = locationColor { dictionary[SerializationKeys.locationColor] = value }
    if let value = locationText { dictionary[SerializationKeys.locationText] = value }
    dictionary[SerializationKeys.locationEditable] = locationEditable
    if let value = tripStatusText { dictionary[SerializationKeys.tripStatusText] = value }
    if let value = locationHeadline { dictionary[SerializationKeys.locationHeadline] = value }
    return dictionary
  }

}
