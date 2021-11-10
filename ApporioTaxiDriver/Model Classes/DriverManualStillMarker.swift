//
//  StillMarker.swift
//
//  Created by apple on 2/13/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverManualStillMarker: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let markerLong = "marker_long"
    static let markerLat = "marker_lat"
    static let markerType = "marker_type"
  }

  // MARK: Properties
  public var markerLong: String?
  public var markerLat: String?
  public var markerType: String?

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
    markerLong <- map[SerializationKeys.markerLong]
    markerLat <- map[SerializationKeys.markerLat]
    markerType <- map[SerializationKeys.markerType]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = markerLong { dictionary[SerializationKeys.markerLong] = value }
    if let value = markerLat { dictionary[SerializationKeys.markerLat] = value }
    if let value = markerType { dictionary[SerializationKeys.markerType] = value }
    return dictionary
  }

}
