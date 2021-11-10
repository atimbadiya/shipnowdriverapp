//
//  VehicleType.swift
//
//  Created by apple on 2/12/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverEndRideVehicleType: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let vehicleTypeMapImage = "vehicleTypeMapImage"
    static let poolEnable = "pool_enable"
    static let id = "id"
    static let vehicleTypeImage = "vehicleTypeImage"
    static let updatedAt = "updated_at"
    static let createdAt = "created_at"
    static let vehicleTypeStatus = "vehicleTypeStatus"
    static let vehicleTypeRank = "vehicleTypeRank"
    static let merchantId = "merchant_id"
  }

  // MARK: Properties
  public var vehicleTypeMapImage: String?
  public var poolEnable: String?
  public var id: Int?
  public var vehicleTypeImage: String?
  public var updatedAt: String?
  public var createdAt: String?
  public var vehicleTypeStatus: String?
  public var vehicleTypeRank: String?
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
    vehicleTypeMapImage <- map[SerializationKeys.vehicleTypeMapImage]
    poolEnable <- map[SerializationKeys.poolEnable]
    id <- map[SerializationKeys.id]
    vehicleTypeImage <- map[SerializationKeys.vehicleTypeImage]
    updatedAt <- map[SerializationKeys.updatedAt]
    createdAt <- map[SerializationKeys.createdAt]
    vehicleTypeStatus <- map[SerializationKeys.vehicleTypeStatus]
    vehicleTypeRank <- map[SerializationKeys.vehicleTypeRank]
    merchantId <- map[SerializationKeys.merchantId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = vehicleTypeMapImage { dictionary[SerializationKeys.vehicleTypeMapImage] = value }
    if let value = poolEnable { dictionary[SerializationKeys.poolEnable] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = vehicleTypeImage { dictionary[SerializationKeys.vehicleTypeImage] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = vehicleTypeStatus { dictionary[SerializationKeys.vehicleTypeStatus] = value }
    if let value = vehicleTypeRank { dictionary[SerializationKeys.vehicleTypeRank] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    return dictionary
  }

}
