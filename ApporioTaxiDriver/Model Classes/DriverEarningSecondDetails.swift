//
//  Details.swift
//
//  Created by apple on 2/15/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverEarningSecondDetails: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let rides = "rides"
    static let driverAmount = "driver_amount"
    static let date = "date"
  }

  // MARK: Properties
  public var rides: String?
  public var driverAmount: String?
  public var date: String?

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
    driverAmount <- map[SerializationKeys.driverAmount]
    date <- map[SerializationKeys.date]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = rides { dictionary[SerializationKeys.rides] = value }
    if let value = driverAmount { dictionary[SerializationKeys.driverAmount] = value }
    if let value = date { dictionary[SerializationKeys.date] = value }
    return dictionary
  }

}
