//
//  RideConfig.swift
//
//  Created by apple on 2/5/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverHomeRideConfig: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let autoUpgradetionStatus = "auto_upgradetion_status"
    static let poolEnable = "pool_enable"
    static let autoUpgradetion = "auto_upgradetion"
    static let poolEnableStatus = "pool_enable_status"
  }

  // MARK: Properties
  public var autoUpgradetionStatus: String?
  public var poolEnable: Bool? = false
  public var autoUpgradetion: Int?
  public var poolEnableStatus: Int?

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
    autoUpgradetionStatus <- map[SerializationKeys.autoUpgradetionStatus]
    poolEnable <- map[SerializationKeys.poolEnable]
    autoUpgradetion <- map[SerializationKeys.autoUpgradetion]
    poolEnableStatus <- map[SerializationKeys.poolEnableStatus]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = autoUpgradetionStatus { dictionary[SerializationKeys.autoUpgradetionStatus] = value }
    dictionary[SerializationKeys.poolEnable] = poolEnable
    if let value = autoUpgradetion { dictionary[SerializationKeys.autoUpgradetion] = value }
    if let value = poolEnableStatus { dictionary[SerializationKeys.poolEnableStatus] = value }
    return dictionary
  }

}
