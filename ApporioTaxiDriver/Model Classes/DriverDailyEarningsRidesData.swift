//
//  RidesData.swift
//
//  Created by apple on 2/15/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverDailyEarningsRidesData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let rideId = "ride_id"
    static let rideEarning = "ride_earning"
    static let ridesColor = "rides_color"
    static let rideName = "ride_name"
  }

  // MARK: Properties
  public var rideId: Int?
  public var rideEarning: String?
  public var ridesColor: String?
  public var rideName: String?

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
    rideId <- map[SerializationKeys.rideId]
    rideEarning <- map[SerializationKeys.rideEarning]
    ridesColor <- map[SerializationKeys.ridesColor]
    rideName <- map[SerializationKeys.rideName]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = rideId { dictionary[SerializationKeys.rideId] = value }
    if let value = rideEarning { dictionary[SerializationKeys.rideEarning] = value }
    if let value = ridesColor { dictionary[SerializationKeys.ridesColor] = value }
    if let value = rideName { dictionary[SerializationKeys.rideName] = value }
    return dictionary
  }

}
