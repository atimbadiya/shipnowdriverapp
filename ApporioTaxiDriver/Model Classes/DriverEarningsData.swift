//
//  Data.swift
//
//  Created by apple on 2/15/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverEarningsData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let outstandColor = "outstand_color"
    static let lastDate = "last_date"
    static let totalWeeklyAmount = "total_weekly_amount"
    static let currency = "currency"
    static let detail = "detail"
    static let startDate = "start_date"
    static let totalWeeklyRides = "total_weekly_rides"
    static let outstandAmount = "outstand_amount"
  }

  // MARK: Properties
  public var outstandColor: String?
  public var lastDate: String?
  public var totalWeeklyAmount: String?
  public var currency: String?
  public var detail: [DriverEarningsDetail]?
  public var startDate: String?
  public var totalWeeklyRides: String?
  public var outstandAmount: String?

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
    outstandColor <- map[SerializationKeys.outstandColor]
    lastDate <- map[SerializationKeys.lastDate]
    totalWeeklyAmount <- map[SerializationKeys.totalWeeklyAmount]
    currency <- map[SerializationKeys.currency]
    detail <- map[SerializationKeys.detail]
    startDate <- map[SerializationKeys.startDate]
    totalWeeklyRides <- map[SerializationKeys.totalWeeklyRides]
    outstandAmount <- map[SerializationKeys.outstandAmount]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = outstandColor { dictionary[SerializationKeys.outstandColor] = value }
    if let value = lastDate { dictionary[SerializationKeys.lastDate] = value }
    if let value = totalWeeklyAmount { dictionary[SerializationKeys.totalWeeklyAmount] = value }
    if let value = currency { dictionary[SerializationKeys.currency] = value }
    if let value = detail { dictionary[SerializationKeys.detail] = value.map { $0.dictionaryRepresentation() } }
    if let value = startDate { dictionary[SerializationKeys.startDate] = value }
    if let value = totalWeeklyRides { dictionary[SerializationKeys.totalWeeklyRides] = value }
    if let value = outstandAmount { dictionary[SerializationKeys.outstandAmount] = value }
    return dictionary
  }

}
