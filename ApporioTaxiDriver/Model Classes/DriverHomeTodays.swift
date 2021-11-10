//
//  Todays.swift
//
//  Created by apple on 2/5/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverHomeTodays: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let todaysEarningColor = "todays_earning_color"
    static let todaysRidesColor = "todays_rides_color"
    static let todaysEarning = "todays_earning"
    static let todaysRides = "todays_rides"
  }

  // MARK: Properties
  public var todaysEarningColor: String?
  public var todaysRidesColor: String?
  public var todaysEarning: String?
  public var todaysRides: Int?

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
    todaysEarningColor <- map[SerializationKeys.todaysEarningColor]
    todaysRidesColor <- map[SerializationKeys.todaysRidesColor]
    todaysEarning <- map[SerializationKeys.todaysEarning]
    todaysRides <- map[SerializationKeys.todaysRides]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = todaysEarningColor { dictionary[SerializationKeys.todaysEarningColor] = value }
    if let value = todaysRidesColor { dictionary[SerializationKeys.todaysRidesColor] = value }
    if let value = todaysEarning { dictionary[SerializationKeys.todaysEarning] = value }
    if let value = todaysRides { dictionary[SerializationKeys.todaysRides] = value }
    return dictionary
  }

}
