//
//  Legs.swift
//
//  Created by Gyanender on 01/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct Legs: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let startLocation = "start_location"
    static let endAddress = "end_address"
    static let endLocation = "end_location"
    static let startAddress = "start_address"
    static let steps = "steps"
    static let distance = "distance"
    static let trafficSpeedEntry = "traffic_speed_entry"
    static let duration = "duration"
    static let viaWaypoint = "via_waypoint"
  }

  // MARK: Properties
  public var startLocation: StartLocation?
  public var endAddress: String?
  public var endLocation: EndLocation?
  public var startAddress: String?
  public var steps: [Steps]?
  public var distance: Distance?
  public var trafficSpeedEntry: [Any]?
  public var duration: Duration?
  public var viaWaypoint: [Any]?

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
    startLocation <- map[SerializationKeys.startLocation]
    endAddress <- map[SerializationKeys.endAddress]
    endLocation <- map[SerializationKeys.endLocation]
    startAddress <- map[SerializationKeys.startAddress]
    steps <- map[SerializationKeys.steps]
    distance <- map[SerializationKeys.distance]
    trafficSpeedEntry <- map[SerializationKeys.trafficSpeedEntry]
    duration <- map[SerializationKeys.duration]
    viaWaypoint <- map[SerializationKeys.viaWaypoint]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = startLocation { dictionary[SerializationKeys.startLocation] = value.dictionaryRepresentation() }
    if let value = endAddress { dictionary[SerializationKeys.endAddress] = value }
    if let value = endLocation { dictionary[SerializationKeys.endLocation] = value.dictionaryRepresentation() }
    if let value = startAddress { dictionary[SerializationKeys.startAddress] = value }
    if let value = steps { dictionary[SerializationKeys.steps] = value.map { $0.dictionaryRepresentation() } }
    if let value = distance { dictionary[SerializationKeys.distance] = value.dictionaryRepresentation() }
    if let value = trafficSpeedEntry { dictionary[SerializationKeys.trafficSpeedEntry] = value }
    if let value = duration { dictionary[SerializationKeys.duration] = value.dictionaryRepresentation() }
    if let value = viaWaypoint { dictionary[SerializationKeys.viaWaypoint] = value }
    return dictionary
  }

}
