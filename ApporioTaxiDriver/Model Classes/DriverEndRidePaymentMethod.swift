//
//  PaymentMethod.swift
//
//  Created by apple on 2/12/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverEndRidePaymentMethod: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let paymentIcon = "payment_icon"
    static let id = "id"
    static let paymentMethod = "payment_method"
    static let paymentMethodStatus = "payment_method_status"
    static let paymentMethodType = "payment_method_type"
  }

  // MARK: Properties
  public var paymentIcon: String?
  public var id: Int?
  public var paymentMethod: String?
  public var paymentMethodStatus: String?
  public var paymentMethodType: String?

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
    paymentIcon <- map[SerializationKeys.paymentIcon]
    id <- map[SerializationKeys.id]
    paymentMethod <- map[SerializationKeys.paymentMethod]
    paymentMethodStatus <- map[SerializationKeys.paymentMethodStatus]
    paymentMethodType <- map[SerializationKeys.paymentMethodType]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = paymentIcon { dictionary[SerializationKeys.paymentIcon] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = paymentMethod { dictionary[SerializationKeys.paymentMethod] = value }
    if let value = paymentMethodStatus { dictionary[SerializationKeys.paymentMethodStatus] = value }
    if let value = paymentMethodType { dictionary[SerializationKeys.paymentMethodType] = value }
    return dictionary
  }

}
