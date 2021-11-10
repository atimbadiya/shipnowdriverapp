//
//  MovableMarkerType.swift
//
//  Created by apple on 2/12/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverTrackingMovableMarkerType: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let driverMarkerLat = "driver_marker_lat"
    static let driverMarkerType = "driver_marker_type"
    static let driverMarkerLong = "driver_marker_long"
    static let driverMarkerBearing = "driver_marker_bearing"
    static let drivermarkerName = "driver_marker_name"
    static let drivermarkerAccuracy = "driver_marker_accuracy"
  }

  // MARK: Properties
  public var driverMarkerLat: String?
  public var driverMarkerType: String?
  public var driverMarkerLong: String?
  public var driverMarkerBearing: String?
    public var drivermarkerName: String?
public var drivermarkerAccuracy: String?
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
    driverMarkerLat <- map[SerializationKeys.driverMarkerLat]
    driverMarkerType <- map[SerializationKeys.driverMarkerType]
    driverMarkerLong <- map[SerializationKeys.driverMarkerLong]
    driverMarkerBearing <- map[SerializationKeys.driverMarkerBearing]
    drivermarkerName <- map[SerializationKeys.drivermarkerName]
    drivermarkerAccuracy <- map[SerializationKeys.drivermarkerAccuracy]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = driverMarkerLat { dictionary[SerializationKeys.driverMarkerLat] = value }
    if let value = driverMarkerType { dictionary[SerializationKeys.driverMarkerType] = value }
    if let value = driverMarkerLong { dictionary[SerializationKeys.driverMarkerLong] = value }
    if let value = driverMarkerBearing { dictionary[SerializationKeys.driverMarkerBearing] = value }
    if let value = drivermarkerName { dictionary[SerializationKeys.drivermarkerName] = value }
    if let value = drivermarkerAccuracy { dictionary[SerializationKeys.drivermarkerAccuracy] = value }
    return dictionary
  }

}
