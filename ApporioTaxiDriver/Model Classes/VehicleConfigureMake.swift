//
//  VehicleMake.swift
//
//  Created by apple on 2/5/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct VehicleConfigureMake: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let updatedAt = "updated_at"
    static let id = "id"
    static let createdAt = "created_at"
    static let vehicleMakeStatus = "vehicleMakeStatus"
    static let vehicleMakeName = "vehicleMakeName"
    static let vehicleMakeLogo = "vehicleMakeLogo"
    static let merchantId = "merchant_id"
  }

  // MARK: Properties
  public var updatedAt: String?
  public var id: Int?
  public var createdAt: String?
  public var vehicleMakeStatus: String?
  public var vehicleMakeName: String?
  public var vehicleMakeLogo: String?
  public var merchantId: String?

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
    updatedAt <- map[SerializationKeys.updatedAt]
    id <- map[SerializationKeys.id]
    createdAt <- map[SerializationKeys.createdAt]
    vehicleMakeStatus <- map[SerializationKeys.vehicleMakeStatus]
    vehicleMakeName <- map[SerializationKeys.vehicleMakeName]
    vehicleMakeLogo <- map[SerializationKeys.vehicleMakeLogo]
    merchantId <- map[SerializationKeys.merchantId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = vehicleMakeStatus { dictionary[SerializationKeys.vehicleMakeStatus] = value }
    if let value = vehicleMakeName { dictionary[SerializationKeys.vehicleMakeName] = value }
    if let value = vehicleMakeLogo { dictionary[SerializationKeys.vehicleMakeLogo] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    return dictionary
  }

}
