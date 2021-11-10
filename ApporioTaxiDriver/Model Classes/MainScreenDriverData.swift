//
//  DriverData.swift
//
//  Created by Atul Jain on 05/10/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct MainScreenDriverData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let profileImage = "profile_image"
    static let driverName = "driver_name"
    static let walletMoney = "wallet_money"
  }

  // MARK: Properties
  public var profileImage: String?
  public var driverName: String?
  public var walletMoney: String?

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
    profileImage <- map[SerializationKeys.profileImage]
    driverName <- map[SerializationKeys.driverName]
    walletMoney <- map[SerializationKeys.walletMoney]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = profileImage { dictionary[SerializationKeys.profileImage] = value }
    if let value = driverName { dictionary[SerializationKeys.driverName] = value }
    if let value = walletMoney { dictionary[SerializationKeys.walletMoney] = value }
    return dictionary
  }

}
