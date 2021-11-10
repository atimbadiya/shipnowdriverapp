//
//  Polydata.swift
//
//  Created by apple on 2/18/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverBookingDetailonePolydata: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let polylineColor = "polyline_color"
    static let polyline = "polyline"
    static let polylineWidth = "polyline_width"
  }

  // MARK: Properties
  public var polylineColor: String?
  public var polyline: String?
  public var polylineWidth: String?

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
    polylineColor <- map[SerializationKeys.polylineColor]
    polyline <- map[SerializationKeys.polyline]
    polylineWidth <- map[SerializationKeys.polylineWidth]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = polylineColor { dictionary[SerializationKeys.polylineColor] = value }
    if let value = polyline { dictionary[SerializationKeys.polyline] = value }
    if let value = polylineWidth { dictionary[SerializationKeys.polylineWidth] = value }
    return dictionary
  }

}
