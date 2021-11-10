//
//  DriverWalletPackage.swift
//
//  Created by apple on 2/21/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverAppConfigureDriverWalletPackage: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let amount = "amount"
  }

  // MARK: Properties
  public var amount: String?

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
    amount <- map[SerializationKeys.amount]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = amount { dictionary[SerializationKeys.amount] = value }
    return dictionary
  }

}
