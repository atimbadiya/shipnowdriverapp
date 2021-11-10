//
//  PaymentHolder.swift
//
//  Created by apple on 2/13/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverRecieptPaymentHolder: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let text = "text"
    static let heading = "heading"
    static let amount = "amount"
    static let paymentmethod = "payment_method"
    static let amountchange = "amount_change"
    static let amountchangetext = "amount_change_text"
  }

  // MARK: Properties
  public var text: String?
  public var heading: String?
  public var amount: String?
    public var paymentmethod: String?
    public var amountchange: Bool? = false
    public var amountchangetext: String?

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
    text <- map[SerializationKeys.text]
    heading <- map[SerializationKeys.heading]
    amount <- map[SerializationKeys.amount]
    paymentmethod <- map[SerializationKeys.paymentmethod]
    amountchange <- map[SerializationKeys.amountchange]
    amountchangetext <- map[SerializationKeys.amountchangetext]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = text { dictionary[SerializationKeys.text] = value }
    if let value = heading { dictionary[SerializationKeys.heading] = value }
    if let value = amount { dictionary[SerializationKeys.amount] = value }
     if let value = paymentmethod { dictionary[SerializationKeys.paymentmethod] = value }
     dictionary[SerializationKeys.amountchange] = amountchange
     if let value = amountchangetext { dictionary[SerializationKeys.amountchangetext] = value }
    return dictionary
  }

}
