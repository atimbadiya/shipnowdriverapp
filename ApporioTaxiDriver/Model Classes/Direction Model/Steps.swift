//
//  Steps.swift
//
//  Created by Gyanender on 01/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct Steps: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let startLocation = "start_location"
    static let endLocation = "end_location"
    static let polyline = "polyline"
    static let travelMode = "travel_mode"
    static let distance = "distance"
    static let htmlInstructions = "html_instructions"
    static let maneuver = "maneuver"
    static let duration = "duration"
  }

  // MARK: Properties
  public var startLocation: StartLocation?
  public var endLocation: EndLocation?
  public var polyline: Polyline?
  public var travelMode: String?
  public var distance: Distance?
  public var htmlInstructions: String?
  public var maneuver: String?
  public var duration: Duration?

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
    endLocation <- map[SerializationKeys.endLocation]
    polyline <- map[SerializationKeys.polyline]
    travelMode <- map[SerializationKeys.travelMode]
    distance <- map[SerializationKeys.distance]
    htmlInstructions <- map[SerializationKeys.htmlInstructions]
    maneuver <- map[SerializationKeys.maneuver]
    duration <- map[SerializationKeys.duration]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = startLocation { dictionary[SerializationKeys.startLocation] = value.dictionaryRepresentation() }
    if let value = endLocation { dictionary[SerializationKeys.endLocation] = value.dictionaryRepresentation() }
    if let value = polyline { dictionary[SerializationKeys.polyline] = value.dictionaryRepresentation() }
    if let value = travelMode { dictionary[SerializationKeys.travelMode] = value }
    if let value = distance { dictionary[SerializationKeys.distance] = value.dictionaryRepresentation() }
    if let value = htmlInstructions { dictionary[SerializationKeys.htmlInstructions] = value }
    if let value = maneuver { dictionary[SerializationKeys.maneuver] = value }
    if let value = duration { dictionary[SerializationKeys.duration] = value.dictionaryRepresentation() }
    return dictionary
  }

}
