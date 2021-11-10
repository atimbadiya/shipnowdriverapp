//
//  PaymentMethod.swift
//
//  Created by Atul Jain on 14/10/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct SubscriptionPaymentMethodModel: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let id = "id"
    static let paymentMethod = "payment_method"
    static let paymentIcon = "payment_icon"
  }

  // MARK: Properties
  public var id: Int?
  public var paymentMethod: String?
  public var paymentIcon: String?

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
    id <- map[SerializationKeys.id]
    paymentMethod <- map[SerializationKeys.paymentMethod]
    paymentIcon <- map[SerializationKeys.paymentIcon]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = paymentMethod { dictionary[SerializationKeys.paymentMethod] = value }
    if let value = paymentIcon { dictionary[SerializationKeys.paymentIcon] = value }
    return dictionary
  }

}
