//
//  Data.swift
//
//  Created by apple on 2/17/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverVehicleModelData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let vehicleModelName = "vehicleModelName"
    static let vehicleMakeId = "vehicle_make_id"
    static let id = "id"
    static let updatedAt = "updated_at"
    static let createdAt = "created_at"
    static let vehicleModelStatus = "vehicleModelStatus"
    static let vehicleSeat = "vehicle_seat"
    static let vehicleTypeId = "vehicle_type_id"
    static let merchantId = "merchant_id"
  }

  // MARK: Properties
  public var vehicleModelName: String?
  public var vehicleMakeId: String?
  public var id: Int?
  public var updatedAt: String?
  public var createdAt: String?
  public var vehicleModelStatus: String?
  public var vehicleSeat: String?
  public var vehicleTypeId: String?
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
    vehicleModelName <- map[SerializationKeys.vehicleModelName]
    vehicleMakeId <- map[SerializationKeys.vehicleMakeId]
    id <- map[SerializationKeys.id]
    updatedAt <- map[SerializationKeys.updatedAt]
    createdAt <- map[SerializationKeys.createdAt]
    vehicleModelStatus <- map[SerializationKeys.vehicleModelStatus]
    vehicleSeat <- map[SerializationKeys.vehicleSeat]
    vehicleTypeId <- map[SerializationKeys.vehicleTypeId]
    merchantId <- map[SerializationKeys.merchantId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = vehicleModelName { dictionary[SerializationKeys.vehicleModelName] = value }
    if let value = vehicleMakeId { dictionary[SerializationKeys.vehicleMakeId] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = vehicleModelStatus { dictionary[SerializationKeys.vehicleModelStatus] = value }
    if let value = vehicleSeat { dictionary[SerializationKeys.vehicleSeat] = value }
    if let value = vehicleTypeId { dictionary[SerializationKeys.vehicleTypeId] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    return dictionary
  }

}
