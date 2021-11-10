//
//  ExpiredVehicleDocuments.swift
//
//  Created by Gyanender on 16/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct ExpiredVehicleDocuments: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let vehicleColor = "vehicle_color"
    static let vehicleImage = "vehicle_image"
    static let updatedAt = "updated_at"
    static let vehicleTypeImage = "vehicleTypeImage"
    static let vehicleModelId = "vehicle_model_id"
    static let ownerId = "owner_id"
    static let vehicleNumberPlateImage = "vehicle_number_plate_image"
    static let driverId = "driver_id"
    static let vehicleTypeId = "vehicle_type_id"
    static let merchantId = "merchant_id"
    static let vehicleTypeName = "VehicleTypeName"
    static let vehicleModelName = "VehicleModelName"
    static let vehicleVerificationStatus = "vehicle_verification_status"
    static let vehicleActiveStatus = "vehicle_active_status"
    static let id = "id"
    static let driverVehicleDocument = "driver_vehicle_document"
    static let shareCode = "shareCode"
    static let vehicleMakeName = "VehicleMakeName"
    static let vehicleMakeId = "vehicle_make_id"
    static let createdAt = "created_at"
    static let vehicleNumber = "vehicle_number"
  }

  // MARK: Properties
  public var vehicleColor: String?
  public var vehicleImage: String?
  public var updatedAt: String?
  public var vehicleTypeImage: String?
  public var vehicleModelId: Int?
  public var ownerId: Int?
  public var vehicleNumberPlateImage: String?
  public var driverId: Int?
  public var vehicleTypeId: Int?
  public var merchantId: Int?
  public var vehicleTypeName: String?
  public var vehicleModelName: String?
  public var vehicleVerificationStatus: Int?
  public var vehicleActiveStatus: Int?
  public var id: Int?
  public var driverVehicleDocument: [DriverVehicleDocument]?
  public var shareCode: String?
  public var vehicleMakeName: String?
  public var vehicleMakeId: Int?
  public var createdAt: String?
  public var vehicleNumber: String?

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
    vehicleColor <- map[SerializationKeys.vehicleColor]
    vehicleImage <- map[SerializationKeys.vehicleImage]
    updatedAt <- map[SerializationKeys.updatedAt]
    vehicleTypeImage <- map[SerializationKeys.vehicleTypeImage]
    vehicleModelId <- map[SerializationKeys.vehicleModelId]
    ownerId <- map[SerializationKeys.ownerId]
    vehicleNumberPlateImage <- map[SerializationKeys.vehicleNumberPlateImage]
    driverId <- map[SerializationKeys.driverId]
    vehicleTypeId <- map[SerializationKeys.vehicleTypeId]
    merchantId <- map[SerializationKeys.merchantId]
    vehicleTypeName <- map[SerializationKeys.vehicleTypeName]
    vehicleModelName <- map[SerializationKeys.vehicleModelName]
    vehicleVerificationStatus <- map[SerializationKeys.vehicleVerificationStatus]
    vehicleActiveStatus <- map[SerializationKeys.vehicleActiveStatus]
    id <- map[SerializationKeys.id]
    driverVehicleDocument <- map[SerializationKeys.driverVehicleDocument]
    shareCode <- map[SerializationKeys.shareCode]
    vehicleMakeName <- map[SerializationKeys.vehicleMakeName]
    vehicleMakeId <- map[SerializationKeys.vehicleMakeId]
    createdAt <- map[SerializationKeys.createdAt]
    vehicleNumber <- map[SerializationKeys.vehicleNumber]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = vehicleColor { dictionary[SerializationKeys.vehicleColor] = value }
    if let value = vehicleImage { dictionary[SerializationKeys.vehicleImage] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = vehicleTypeImage { dictionary[SerializationKeys.vehicleTypeImage] = value }
    if let value = vehicleModelId { dictionary[SerializationKeys.vehicleModelId] = value }
    if let value = ownerId { dictionary[SerializationKeys.ownerId] = value }
    if let value = vehicleNumberPlateImage { dictionary[SerializationKeys.vehicleNumberPlateImage] = value }
    if let value = driverId { dictionary[SerializationKeys.driverId] = value }
    if let value = vehicleTypeId { dictionary[SerializationKeys.vehicleTypeId] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = vehicleTypeName { dictionary[SerializationKeys.vehicleTypeName] = value }
    if let value = vehicleModelName { dictionary[SerializationKeys.vehicleModelName] = value }
    if let value = vehicleVerificationStatus { dictionary[SerializationKeys.vehicleVerificationStatus] = value }
    if let value = vehicleActiveStatus { dictionary[SerializationKeys.vehicleActiveStatus] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = driverVehicleDocument { dictionary[SerializationKeys.driverVehicleDocument] = value.map { $0.dictionaryRepresentation() } }
    if let value = shareCode { dictionary[SerializationKeys.shareCode] = value }
    if let value = vehicleMakeName { dictionary[SerializationKeys.vehicleMakeName] = value }
    if let value = vehicleMakeId { dictionary[SerializationKeys.vehicleMakeId] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = vehicleNumber { dictionary[SerializationKeys.vehicleNumber] = value }
    return dictionary
  }

}
