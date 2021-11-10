//
//  PriceCard.swift
//
//  Created by apple on 2/12/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverEndRidePriceCard: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let minimumWalletAmount = "minimum_wallet_amount"
    static let updatedAt = "updated_at"
    static let cancelCharges = "cancel_charges"
    static let cancelTime = "cancel_time"
    static let baseFare = "base_fare"
    static let vehicleTypeId = "vehicle_type_id"
    static let merchantId = "merchant_id"
    static let pricingType = "pricing_type"
    static let id = "id"
    static let countryAreaId = "country_area_id"
    static let createdAt = "created_at"
    static let cancelAmount = "cancel_amount"
    static let serviceTypeId = "service_type_id"
  }

  // MARK: Properties
  public var minimumWalletAmount: String?
  public var updatedAt: String?
  public var cancelCharges: String?
  public var cancelTime: String?
  public var baseFare: String?
  public var vehicleTypeId: String?
  public var merchantId: String?
  public var pricingType: String?
  public var id: Int?
  public var countryAreaId: String?
  public var createdAt: String?
  public var cancelAmount: String?
  public var serviceTypeId: String?

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
    minimumWalletAmount <- map[SerializationKeys.minimumWalletAmount]
    updatedAt <- map[SerializationKeys.updatedAt]
    cancelCharges <- map[SerializationKeys.cancelCharges]
    cancelTime <- map[SerializationKeys.cancelTime]
    baseFare <- map[SerializationKeys.baseFare]
    vehicleTypeId <- map[SerializationKeys.vehicleTypeId]
    merchantId <- map[SerializationKeys.merchantId]
    pricingType <- map[SerializationKeys.pricingType]
    id <- map[SerializationKeys.id]
    countryAreaId <- map[SerializationKeys.countryAreaId]
    createdAt <- map[SerializationKeys.createdAt]
    cancelAmount <- map[SerializationKeys.cancelAmount]
    serviceTypeId <- map[SerializationKeys.serviceTypeId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = minimumWalletAmount { dictionary[SerializationKeys.minimumWalletAmount] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = cancelCharges { dictionary[SerializationKeys.cancelCharges] = value }
    if let value = cancelTime { dictionary[SerializationKeys.cancelTime] = value }
    if let value = baseFare { dictionary[SerializationKeys.baseFare] = value }
    if let value = vehicleTypeId { dictionary[SerializationKeys.vehicleTypeId] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = pricingType { dictionary[SerializationKeys.pricingType] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = countryAreaId { dictionary[SerializationKeys.countryAreaId] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = cancelAmount { dictionary[SerializationKeys.cancelAmount] = value }
    if let value = serviceTypeId { dictionary[SerializationKeys.serviceTypeId] = value }
    return dictionary
  }

}
