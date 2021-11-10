//
//  Data.swift
//
//  Created by apple on 2/15/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverDailyEarningsData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let totalEarning = "total_earning"
    static let totalBilledToCustomer = "total_billed_to_customer"
    static let comissionDeducted = "comission_deducted"
    static let overallRating = "overall_rating"
    static let onlineTime = "online_time"
    static let acceptanceRate = "acceptance_rate"
    static let date = "date"
    static let completedTrip = "completed_trip"
    static let ridesData = "rides_data"
  }

  // MARK: Properties
  public var totalEarning: String?
  public var totalBilledToCustomer: String?
  public var comissionDeducted: String?
  public var overallRating: String?
  public var onlineTime: String?
  public var acceptanceRate: String?
  public var date: String?
  public var completedTrip: Int?
  public var ridesData: [DriverDailyEarningsRidesData]?

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
    totalBilledToCustomer <- map[SerializationKeys.totalBilledToCustomer]
    comissionDeducted <- map[SerializationKeys.comissionDeducted]
    overallRating <- map[SerializationKeys.overallRating]
    onlineTime <- map[SerializationKeys.onlineTime]
    acceptanceRate <- map[SerializationKeys.acceptanceRate]
    date <- map[SerializationKeys.date]
    completedTrip <- map[SerializationKeys.completedTrip]
    ridesData <- map[SerializationKeys.ridesData]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = totalEarning { dictionary[SerializationKeys.totalEarning] = value }
    if let value = totalBilledToCustomer { dictionary[SerializationKeys.totalBilledToCustomer] = value }
    if let value = comissionDeducted { dictionary[SerializationKeys.comissionDeducted] = value }
    if let value = overallRating { dictionary[SerializationKeys.overallRating] = value }
    if let value = onlineTime { dictionary[SerializationKeys.onlineTime] = value }
    if let value = acceptanceRate { dictionary[SerializationKeys.acceptanceRate] = value }
    if let value = date { dictionary[SerializationKeys.date] = value }
    if let value = completedTrip { dictionary[SerializationKeys.completedTrip] = value }
    if let value = ridesData { dictionary[SerializationKeys.ridesData] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
