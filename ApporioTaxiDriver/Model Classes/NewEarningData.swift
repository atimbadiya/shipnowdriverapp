//
//  Data.swift
//
//  Created by Atul Jain on 17/06/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct NewEarningData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let previousPeriod = "previous_period"
    static let totalEarnings = "total_earnings"
    static let holderData = "holder_data"
    static let balanceDue = "balance_due"
    static let currentPeriod = "current_period"
    static let trips = "trips"
    static let nextperiod = "next_period"
    static let currentperiodforsend = "current_period_forsend"
    static let settledmessage = "settled_message"
    static let settledmessagecolour = "settled_message_colour"
  }

  // MARK: Properties
  public var previousPeriod: String?
  public var totalEarnings: String?
  public var holderData: [NewEarningHolderData]?
  public var balanceDue: String?
  public var currentPeriod: String?
  public var trips: Int?
public var nextperiod: String?
    public var currentperiodforsend: String?
    public var settledmessage: String?
    public var settledmessagecolour: String?
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
    previousPeriod <- map[SerializationKeys.previousPeriod]
    totalEarnings <- map[SerializationKeys.totalEarnings]
    holderData <- map[SerializationKeys.holderData]
    balanceDue <- map[SerializationKeys.balanceDue]
    currentPeriod <- map[SerializationKeys.currentPeriod]
    trips <- map[SerializationKeys.trips]
    nextperiod <- map[SerializationKeys.nextperiod]
    currentperiodforsend <- map[SerializationKeys.currentperiodforsend]
    settledmessage <- map[SerializationKeys.settledmessage]
    settledmessagecolour <- map[SerializationKeys.settledmessagecolour]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = previousPeriod { dictionary[SerializationKeys.previousPeriod] = value }
    if let value = totalEarnings { dictionary[SerializationKeys.totalEarnings] = value }
    if let value = holderData { dictionary[SerializationKeys.holderData] = value.map { $0.dictionaryRepresentation() } }
    if let value = balanceDue { dictionary[SerializationKeys.balanceDue] = value }
    if let value = currentPeriod { dictionary[SerializationKeys.currentPeriod] = value }
    if let value = trips { dictionary[SerializationKeys.trips] = value }
    if let value = nextperiod { dictionary[SerializationKeys.nextperiod] = value }
    if let value = currentperiodforsend { dictionary[SerializationKeys.currentperiodforsend] = value }
    if let value = settledmessage { dictionary[SerializationKeys.settledmessage] = value }
    if let value = settledmessagecolour { dictionary[SerializationKeys.settledmessagecolour] = value }
    return dictionary
  }

}
