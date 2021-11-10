//
//  Data.swift
//
//  Created by Gyanender on 20/02/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct VehicleListData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let vehicleColor = "vehicle_color"
    static let activeStatus = "activeStatus"
    static let vehicleImage = "vehicle_image"
    static let vehicleModelId = "vehicle_model_id"
    static let vehicleNumberPlateImage = "vehicle_number_plate_image"
    static let vehicleMake = "vehicle_make"
    static let vehicleTypeId = "vehicle_type_id"
    static let vehicleTypeMapImage = "vehicleTypeMapImage"
    static let shareCode = "shareCode"
    static let vehicleVerificationStatus = "vehicle_verification_status"
    static let id = "id"
    static let vehicleNumber = "vehicle_number"
    static let vehicleType = "vehicle_type"
    static let poolEnable = "pool_enable"
    static let updatedAt = "updated_at"
    static let vehicleTypeImage = "vehicleTypeImage"
    static let showMsg = "show_msg"
    static let readyForLive = "ready_for_live"
    static let ownerId = "owner_id"
    static let driverId = "driver_id"
    static let vehicleMakeLogo = "vehicleMakeLogo"
    static let merchantId = "merchant_id"
    static let vehicleMakeId = "vehicle_make_id"
    static let vehicleActiveStatus = "vehicle_active_status"
    static let createdAt = "created_at"
    static let serviceTypes = "service_types"
    static let vehicleModel = "vehicle_model"
  }

  // MARK: Properties
  public var vehicleColor: String?
  public var activeStatus: Int?
  public var vehicleImage: String?
  public var vehicleModelId: String?
  public var vehicleNumberPlateImage: String?
  public var vehicleMake: String?
  public var vehicleTypeId: String?
  public var vehicleTypeMapImage: String?
  public var shareCode: String?
  public var vehicleVerificationStatus: Int?
  public var id: Int?
  public var vehicleNumber: String?
  public var vehicleType: String?
  public var poolEnable: String?
  public var updatedAt: String?
  public var vehicleTypeImage: String?
  public var showMsg: String?
  public var readyForLive: Int?
  public var ownerId: String?
  public var driverId: String?
  public var vehicleMakeLogo: String?
  public var merchantId: String?
  public var vehicleMakeId: String?
  public var vehicleActiveStatus: String?
  public var createdAt: String?
  public var serviceTypes: String?
  public var vehicleModel: String?

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
    activeStatus <- map[SerializationKeys.activeStatus]
    vehicleImage <- map[SerializationKeys.vehicleImage]
    vehicleModelId <- map[SerializationKeys.vehicleModelId]
    vehicleNumberPlateImage <- map[SerializationKeys.vehicleNumberPlateImage]
    vehicleMake <- map[SerializationKeys.vehicleMake]
    vehicleTypeId <- map[SerializationKeys.vehicleTypeId]
    vehicleTypeMapImage <- map[SerializationKeys.vehicleTypeMapImage]
    shareCode <- map[SerializationKeys.shareCode]
    vehicleVerificationStatus <- map[SerializationKeys.vehicleVerificationStatus]
    id <- map[SerializationKeys.id]
    vehicleNumber <- map[SerializationKeys.vehicleNumber]
    vehicleType <- map[SerializationKeys.vehicleType]
    poolEnable <- map[SerializationKeys.poolEnable]
    updatedAt <- map[SerializationKeys.updatedAt]
    vehicleTypeImage <- map[SerializationKeys.vehicleTypeImage]
    showMsg <- map[SerializationKeys.showMsg]
    readyForLive <- map[SerializationKeys.readyForLive]
    ownerId <- map[SerializationKeys.ownerId]
    driverId <- map[SerializationKeys.driverId]
    vehicleMakeLogo <- map[SerializationKeys.vehicleMakeLogo]
    merchantId <- map[SerializationKeys.merchantId]
    vehicleMakeId <- map[SerializationKeys.vehicleMakeId]
    vehicleActiveStatus <- map[SerializationKeys.vehicleActiveStatus]
    createdAt <- map[SerializationKeys.createdAt]
    serviceTypes <- map[SerializationKeys.serviceTypes]
    vehicleModel <- map[SerializationKeys.vehicleModel]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = vehicleColor { dictionary[SerializationKeys.vehicleColor] = value }
    if let value = activeStatus { dictionary[SerializationKeys.activeStatus] = value }
    if let value = vehicleImage { dictionary[SerializationKeys.vehicleImage] = value }
    if let value = vehicleModelId { dictionary[SerializationKeys.vehicleModelId] = value }
    if let value = vehicleNumberPlateImage { dictionary[SerializationKeys.vehicleNumberPlateImage] = value }
    if let value = vehicleMake { dictionary[SerializationKeys.vehicleMake] = value }
    if let value = vehicleTypeId { dictionary[SerializationKeys.vehicleTypeId] = value }
    if let value = vehicleTypeMapImage { dictionary[SerializationKeys.vehicleTypeMapImage] = value }
    if let value = shareCode { dictionary[SerializationKeys.shareCode] = value }
    if let value = vehicleVerificationStatus { dictionary[SerializationKeys.vehicleVerificationStatus] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = vehicleNumber { dictionary[SerializationKeys.vehicleNumber] = value }
    if let value = vehicleType { dictionary[SerializationKeys.vehicleType] = value }
    if let value = poolEnable { dictionary[SerializationKeys.poolEnable] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = vehicleTypeImage { dictionary[SerializationKeys.vehicleTypeImage] = value }
    if let value = showMsg { dictionary[SerializationKeys.showMsg] = value }
    if let value = readyForLive { dictionary[SerializationKeys.readyForLive] = value }
    if let value = ownerId { dictionary[SerializationKeys.ownerId] = value }
    if let value = driverId { dictionary[SerializationKeys.driverId] = value }
    if let value = vehicleMakeLogo { dictionary[SerializationKeys.vehicleMakeLogo] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = vehicleMakeId { dictionary[SerializationKeys.vehicleMakeId] = value }
    if let value = vehicleActiveStatus { dictionary[SerializationKeys.vehicleActiveStatus] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = serviceTypes { dictionary[SerializationKeys.serviceTypes] = value }
    if let value = vehicleModel { dictionary[SerializationKeys.vehicleModel] = value }
    return dictionary
  }

}
