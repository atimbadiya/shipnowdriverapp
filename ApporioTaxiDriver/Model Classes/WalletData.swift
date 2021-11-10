//
//  Data.swift
//
//  Created by Gyanender on 13/02/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct WalletData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let walletMoney = "wallet_money"
    static let recentTransactoin = "recent_transactoin"
  }

  // MARK: Properties
  public var walletMoney: String?
  public var recentTransactoin: [RecentTransactoin]?

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
    walletMoney <- map[SerializationKeys.walletMoney]
    recentTransactoin <- map[SerializationKeys.recentTransactoin]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = walletMoney { dictionary[SerializationKeys.walletMoney] = value }
    if let value = recentTransactoin { dictionary[SerializationKeys.recentTransactoin] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
