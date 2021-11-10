//
//  Data.swift
//
//  Created by Gyanender on 29/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct ManageCardsData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let cardNumber = "card_number"
    static let cardType = "card_type"
    static let expMonth = "exp_month"
    static let expYear = "exp_year"
    static let cardId = "card_id"
  }

  // MARK: Properties
  public var cardNumber: String?
  public var cardType: String?
  public var expMonth: Int?
  public var expYear: Int?
  public var cardId: Int?

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
    cardNumber <- map[SerializationKeys.cardNumber]
    cardType <- map[SerializationKeys.cardType]
    expMonth <- map[SerializationKeys.expMonth]
    expYear <- map[SerializationKeys.expYear]
    cardId <- map[SerializationKeys.cardId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = cardNumber { dictionary[SerializationKeys.cardNumber] = value }
    if let value = cardType { dictionary[SerializationKeys.cardType] = value }
    if let value = expMonth { dictionary[SerializationKeys.expMonth] = value }
    if let value = expYear { dictionary[SerializationKeys.expYear] = value }
    if let value = cardId { dictionary[SerializationKeys.cardId] = value }
    return dictionary
  }

}
