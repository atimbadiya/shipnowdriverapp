//
//  Data.swift
//
//  Created by apple on 2/12/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverTrackingData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let cancelable = "cancelable"
    static let location = "location"
    static let polydata = "polydata"
    static let movableMarkerType = "movable_marker_type"
    static let stilMarker = "stil_marker"
  }

  // MARK: Properties
  public var cancelable: Bool? = false
  public var location: DriverTrackingLocation?
  public var polydata: DriverTrackingPolydata?
  public var movableMarkerType: DriverTrackingMovableMarkerType?
  public var stilMarker: DriverTrackingStilMarker?

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
    cancelable <- map[SerializationKeys.cancelable]
    location <- map[SerializationKeys.location]
    polydata <- map[SerializationKeys.polydata]
    movableMarkerType <- map[SerializationKeys.movableMarkerType]
    stilMarker <- map[SerializationKeys.stilMarker]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.cancelable] = cancelable
    if let value = location { dictionary[SerializationKeys.location] = value.dictionaryRepresentation() }
    if let value = polydata { dictionary[SerializationKeys.polydata] = value.dictionaryRepresentation() }
    if let value = movableMarkerType { dictionary[SerializationKeys.movableMarkerType] = value.dictionaryRepresentation() }
    if let value = stilMarker { dictionary[SerializationKeys.stilMarker] = value.dictionaryRepresentation() }
    return dictionary
  }

}
