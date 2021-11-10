//
//  RecentTransactoin.swift
//
//  Created by Gyanender on 13/02/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct RecentTransactoin: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let icon = "icon"
    static let narration = "narration"
    static let platform = "platform"
    static let paymentMethod = "payment_method"
    static let descriptionValue = "description"
    static let date = "date"
    static let driverId = "driver_id"
    static let amount = "amount"
    static let valueColor = "value_color"
    static let transactionType = "transaction_type"
  }

  // MARK: Properties
  public var icon: String?
  public var narration: String?
  public var platform: String?
  public var paymentMethod: String?
  public var descriptionValue: String?
  public var date: String?
  public var driverId: String?
  public var amount: String?
  public var valueColor: String?
  public var transactionType: String?

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
    icon <- map[SerializationKeys.icon]
    narration <- map[SerializationKeys.narration]
    platform <- map[SerializationKeys.platform]
    paymentMethod <- map[SerializationKeys.paymentMethod]
    descriptionValue <- map[SerializationKeys.descriptionValue]
    date <- map[SerializationKeys.date]
    driverId <- map[SerializationKeys.driverId]
    amount <- map[SerializationKeys.amount]
    valueColor <- map[SerializationKeys.valueColor]
    transactionType <- map[SerializationKeys.transactionType]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = icon { dictionary[SerializationKeys.icon] = value }
    if let value = narration { dictionary[SerializationKeys.narration] = value }
    if let value = platform { dictionary[SerializationKeys.platform] = value }
    if let value = paymentMethod { dictionary[SerializationKeys.paymentMethod] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = date { dictionary[SerializationKeys.date] = value }
    if let value = driverId { dictionary[SerializationKeys.driverId] = value }
    if let value = amount { dictionary[SerializationKeys.amount] = value }
    if let value = valueColor { dictionary[SerializationKeys.valueColor] = value }
    if let value = transactionType { dictionary[SerializationKeys.transactionType] = value }
    return dictionary
  }

}
