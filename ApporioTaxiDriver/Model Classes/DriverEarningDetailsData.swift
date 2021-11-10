//
//  Data.swift
//
//  Created by apple on 2/15/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverEarningDetailsData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let totalEarning = "total_earning"
    static let totalBilledToConsumer = "total_billed_to_consumer"
    static let weeklyData = "weekly_data"
    static let dateText = "date_text"
    static let totalCommisionDeducted = "total_commision_deducted"
    static let outstandAmount = "outstand_amount"
    static let totalRide = "total_ride"
  }

  // MARK: Properties
  public var totalEarning: String?
  public var totalBilledToConsumer: String?
  public var weeklyData: [DriverEarningWeeklyData]?
  public var dateText: String?
  public var totalCommisionDeducted: String?
  public var outstandAmount: String?
  public var totalRide: String?

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
    totalEarning <- map[SerializationKeys.totalEarning]
    totalBilledToConsumer <- map[SerializationKeys.totalBilledToConsumer]
    weeklyData <- map[SerializationKeys.weeklyData]
    dateText <- map[SerializationKeys.dateText]
    totalCommisionDeducted <- map[SerializationKeys.totalCommisionDeducted]
    outstandAmount <- map[SerializationKeys.outstandAmount]
    totalRide <- map[SerializationKeys.totalRide]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = totalEarning { dictionary[SerializationKeys.totalEarning] = value }
    if let value = totalBilledToConsumer { dictionary[SerializationKeys.totalBilledToConsumer] = value }
    if let value = weeklyData { dictionary[SerializationKeys.weeklyData] = value.map { $0.dictionaryRepresentation() } }
    if let value = dateText { dictionary[SerializationKeys.dateText] = value }
    if let value = totalCommisionDeducted { dictionary[SerializationKeys.totalCommisionDeducted] = value }
    if let value = outstandAmount { dictionary[SerializationKeys.outstandAmount] = value }
    if let value = totalRide { dictionary[SerializationKeys.totalRide] = value }
    return dictionary
  }

}
