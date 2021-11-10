//
//  Data.swift
//
//  Created by Atul Jain on 19/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct ManualDispatchCheckOutData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let dropLocation = "drop_location"
    static let autoUpgradetion = "auto_upgradetion"
    static let pickupLocation = "pickup_location"
    static let promoCode = "promo_code"
    static let dropLatitude = "drop_latitude"
    static let dropLongitude = "drop_longitude"
    static let estimateBill = "estimate_bill"
    static let vehicleTypeId = "vehicle_type_id"
    static let bookingType = "booking_type"
    static let id = "id"
    static let estimateDistance = "estimate_distance"
    static let estimateTime = "estimate_time"
    static let estimateDriverDistnace = "estimate_driver_distnace"
    static let priceCardId = "price_card_id"
    static let mapImage = "map_image"
    static let updatedAt = "updated_at"
    static let pickupLongitude = "pickup_longitude"
    static let totalDropLocation = "total_drop_location"
    static let merchantId = "merchant_id"
    static let paymentMethodId = "payment_method_id"
    static let estimateDriverTime = "estimate_driver_time"
    static let pickupLatitude = "pickup_latitude"
    static let countryAreaId = "country_area_id"
    static let createdAt = "created_at"
    static let serviceTypeId = "service_type_id"
    static let userId = "user_id"
  }

  // MARK: Properties
  public var dropLocation: String?
  public var autoUpgradetion: Int?
  public var pickupLocation: String?
  public var promoCode: String?
  public var dropLatitude: String?
  public var dropLongitude: String?
  public var estimateBill: String?
  public var vehicleTypeId: Int?
  public var bookingType: Int?
  public var id: Int?
  public var estimateDistance: String?
  public var estimateTime: String?
  public var estimateDriverDistnace: String?
  public var priceCardId: Int?
  public var mapImage: String?
  public var updatedAt: String?
  public var pickupLongitude: String?
  public var totalDropLocation: Int?
  public var merchantId: Int?
  public var paymentMethodId: Int?
  public var estimateDriverTime: String?
  public var pickupLatitude: String?
  public var countryAreaId: Int?
  public var createdAt: String?
  public var serviceTypeId: Int?
  public var userId: Int?

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
    dropLocation <- map[SerializationKeys.dropLocation]
    autoUpgradetion <- map[SerializationKeys.autoUpgradetion]
    pickupLocation <- map[SerializationKeys.pickupLocation]
    promoCode <- map[SerializationKeys.promoCode]
    dropLatitude <- map[SerializationKeys.dropLatitude]
    dropLongitude <- map[SerializationKeys.dropLongitude]
    estimateBill <- map[SerializationKeys.estimateBill]
    vehicleTypeId <- map[SerializationKeys.vehicleTypeId]
    bookingType <- map[SerializationKeys.bookingType]
    id <- map[SerializationKeys.id]
    estimateDistance <- map[SerializationKeys.estimateDistance]
    estimateTime <- map[SerializationKeys.estimateTime]
    estimateDriverDistnace <- map[SerializationKeys.estimateDriverDistnace]
    priceCardId <- map[SerializationKeys.priceCardId]
    mapImage <- map[SerializationKeys.mapImage]
    updatedAt <- map[SerializationKeys.updatedAt]
    pickupLongitude <- map[SerializationKeys.pickupLongitude]
    totalDropLocation <- map[SerializationKeys.totalDropLocation]
    merchantId <- map[SerializationKeys.merchantId]
    paymentMethodId <- map[SerializationKeys.paymentMethodId]
    estimateDriverTime <- map[SerializationKeys.estimateDriverTime]
    pickupLatitude <- map[SerializationKeys.pickupLatitude]
    countryAreaId <- map[SerializationKeys.countryAreaId]
    createdAt <- map[SerializationKeys.createdAt]
    serviceTypeId <- map[SerializationKeys.serviceTypeId]
    userId <- map[SerializationKeys.userId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = dropLocation { dictionary[SerializationKeys.dropLocation] = value }
    if let value = autoUpgradetion { dictionary[SerializationKeys.autoUpgradetion] = value }
    if let value = pickupLocation { dictionary[SerializationKeys.pickupLocation] = value }
    if let value = promoCode { dictionary[SerializationKeys.promoCode] = value }
    if let value = dropLatitude { dictionary[SerializationKeys.dropLatitude] = value }
    if let value = dropLongitude { dictionary[SerializationKeys.dropLongitude] = value }
    if let value = estimateBill { dictionary[SerializationKeys.estimateBill] = value }
    if let value = vehicleTypeId { dictionary[SerializationKeys.vehicleTypeId] = value }
    if let value = bookingType { dictionary[SerializationKeys.bookingType] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = estimateDistance { dictionary[SerializationKeys.estimateDistance] = value }
    if let value = estimateTime { dictionary[SerializationKeys.estimateTime] = value }
    if let value = estimateDriverDistnace { dictionary[SerializationKeys.estimateDriverDistnace] = value }
    if let value = priceCardId { dictionary[SerializationKeys.priceCardId] = value }
    if let value = mapImage { dictionary[SerializationKeys.mapImage] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = pickupLongitude { dictionary[SerializationKeys.pickupLongitude] = value }
    if let value = totalDropLocation { dictionary[SerializationKeys.totalDropLocation] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = paymentMethodId { dictionary[SerializationKeys.paymentMethodId] = value }
    if let value = estimateDriverTime { dictionary[SerializationKeys.estimateDriverTime] = value }
    if let value = pickupLatitude { dictionary[SerializationKeys.pickupLatitude] = value }
    if let value = countryAreaId { dictionary[SerializationKeys.countryAreaId] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = serviceTypeId { dictionary[SerializationKeys.serviceTypeId] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    return dictionary
  }

}
