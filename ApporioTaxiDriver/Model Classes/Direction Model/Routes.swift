//
//  Routes.swift
//
//  Created by Gyanender on 01/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct Routes: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let summary = "summary"
    static let copyrights = "copyrights"
    static let overviewPolyline = "overview_polyline"
    static let bounds = "bounds"
    static let waypointOrder = "waypoint_order"
    static let warnings = "warnings"
    static let legs = "legs"
  }

  // MARK: Properties
  public var summary: String?
  public var copyrights: String?
  public var overviewPolyline: OverviewPolyline?
  public var bounds: Bounds?
  public var waypointOrder: [Int]?
  public var warnings: [Any]?
  public var legs: [Legs]?

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
    summary <- map[SerializationKeys.summary]
    copyrights <- map[SerializationKeys.copyrights]
    overviewPolyline <- map[SerializationKeys.overviewPolyline]
    bounds <- map[SerializationKeys.bounds]
    waypointOrder <- map[SerializationKeys.waypointOrder]
    warnings <- map[SerializationKeys.warnings]
    legs <- map[SerializationKeys.legs]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = summary { dictionary[SerializationKeys.summary] = value }
    if let value = copyrights { dictionary[SerializationKeys.copyrights] = value }
    if let value = overviewPolyline { dictionary[SerializationKeys.overviewPolyline] = value.dictionaryRepresentation() }
    if let value = bounds { dictionary[SerializationKeys.bounds] = value.dictionaryRepresentation() }
    if let value = waypointOrder { dictionary[SerializationKeys.waypointOrder] = value }
    if let value = warnings { dictionary[SerializationKeys.warnings] = value }
    if let value = legs { dictionary[SerializationKeys.legs] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
