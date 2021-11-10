//
//  WeeklyData.swift
//
//  Created by apple on 2/15/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverEarningWeeklyData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let rides = "rides"
    static let date = "date"
    static let dayEarning = "day_earning"
    static let ridesColor = "rides_color"
    static let dayName = "day_name"
  }

  // MARK: Properties
  public var rides: String?
  public var date: String?
  public var dayEarning: String?
  public var ridesColor: String?
  public var dayName: String?

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
    rides <- map[SerializationKeys.rides]
    date <- map[SerializationKeys.date]
    dayEarning <- map[SerializationKeys.dayEarning]
    ridesColor <- map[SerializationKeys.ridesColor]
    dayName <- map[SerializationKeys.dayName]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = rides { dictionary[SerializationKeys.rides] = value }
    if let value = date { dictionary[SerializationKeys.date] = value }
    if let value = dayEarning { dictionary[SerializationKeys.dayEarning] = value }
    if let value = ridesColor { dictionary[SerializationKeys.ridesColor] = value }
    if let value = dayName { dictionary[SerializationKeys.dayName] = value }
    return dictionary
  }

}
