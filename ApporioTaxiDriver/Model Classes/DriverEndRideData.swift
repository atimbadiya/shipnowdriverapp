//
//  Data.swift
//
//  Created by apple on 2/12/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverEndRideData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let dropLocation = "drop_location"
    static let platform = "platform"
    static let pickupLocation = "pickup_location"
    static let promoCode = "promo_code"
    static let dropLatitude = "drop_latitude"
    static let estimateBill = "estimate_bill"
    static let vehicleTypeId = "vehicle_type_id"
    static let cardId = "card_id"
    static let id = "id"
    static let estimateDistance = "estimate_distance"
    static let paymentStatus = "payment_status"
    static let priceCardId = "price_card_id"
    static let estimateDriverDistnace = "estimate_driver_distnace"
    static let pickupLongitude = "pickup_longitude"
    static let driverId = "driver_id"
    static let bookingStatus = "booking_status"
    static let paymentMethodId = "payment_method_id"
    static let estimateDriverTime = "estimate_driver_time"
    static let countryAreaId = "country_area_id"
    static let paymentMethod = "payment_method"
    static let createdAt = "created_at"
    static let finalAmountPaid = "final_amount_paid"
    static let numberOfRider = "number_of_rider"
    static let rideOtpVerify = "ride_otp_verify"
    static let autoUpgradetion = "auto_upgradetion"
    static let dropLongitude = "drop_longitude"
    static let bookingType = "booking_type"
    static let estimateTime = "estimate_time"
    static let ployPoints = "ploy_points"
    static let vehicleType = "vehicle_type"
    static let priceCard = "price_card"
    static let user = "user"
    static let updatedAt = "updated_at"
    static let mapImage = "map_image"
    static let travelDistance = "travel_distance"
    static let totalDropLocation = "total_drop_location"
    static let travelTime = "travel_time"
    static let merchantId = "merchant_id"
    static let bookingTimestamp = "booking_timestamp"
    static let pickupLatitude = "pickup_latitude"
    static let serviceType = "service_type"
    static let travelTimeMin = "travel_time_min"
    static let uniqueId = "unique_id"
    static let driverVehicleId = "driver_vehicle_id"
    static let serviceTypeId = "service_type_id"
    static let userId = "user_id"
    static let waypoints = "waypoints"
  }

  // MARK: Properties
  public var dropLocation: String?
  public var platform: String?
  public var pickupLocation: String?
  public var promoCode: String?
  public var dropLatitude: String?
  public var estimateBill: String?
  public var vehicleTypeId: String?
  public var cardId: String?
  public var id: Int?
  public var estimateDistance: String?
  public var paymentStatus: String?
  public var priceCardId: String?
  public var estimateDriverDistnace: String?
  public var pickupLongitude: String?
  public var driverId: String?
  public var bookingStatus: Int?
  public var paymentMethodId: String?
  public var estimateDriverTime: String?
  public var countryAreaId: String?
  public var paymentMethod: DriverEndRidePaymentMethod?
  public var createdAt: String?
  public var finalAmountPaid: String?
  public var numberOfRider: String?
  public var rideOtpVerify: String?
  public var autoUpgradetion: String?
  public var dropLongitude: String?
  public var bookingType: String?
  public var estimateTime: String?
  public var ployPoints: String?
  public var vehicleType: DriverEndRideVehicleType?
  public var priceCard: DriverEndRidePriceCard?
  public var user: DriverEndRideUser?
  public var updatedAt: String?
  public var mapImage: String?
  public var travelDistance: String?
  public var totalDropLocation: String?
  public var travelTime: String?
  public var merchantId: String?
  public var bookingTimestamp: String?
  public var pickupLatitude: String?
  public var serviceType: DriverEndRideServiceType?
  public var travelTimeMin: Float?
  public var uniqueId: String?
  public var driverVehicleId: String?
  public var serviceTypeId: String?
  public var userId: String?
  public var waypoints: String?

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
    platform <- map[SerializationKeys.platform]
    pickupLocation <- map[SerializationKeys.pickupLocation]
    promoCode <- map[SerializationKeys.promoCode]
    dropLatitude <- map[SerializationKeys.dropLatitude]
    estimateBill <- map[SerializationKeys.estimateBill]
    vehicleTypeId <- map[SerializationKeys.vehicleTypeId]
    cardId <- map[SerializationKeys.cardId]
    id <- map[SerializationKeys.id]
    estimateDistance <- map[SerializationKeys.estimateDistance]
    paymentStatus <- map[SerializationKeys.paymentStatus]
    priceCardId <- map[SerializationKeys.priceCardId]
    estimateDriverDistnace <- map[SerializationKeys.estimateDriverDistnace]
    pickupLongitude <- map[SerializationKeys.pickupLongitude]
    driverId <- map[SerializationKeys.driverId]
    bookingStatus <- map[SerializationKeys.bookingStatus]
    paymentMethodId <- map[SerializationKeys.paymentMethodId]
    estimateDriverTime <- map[SerializationKeys.estimateDriverTime]
    countryAreaId <- map[SerializationKeys.countryAreaId]
    paymentMethod <- map[SerializationKeys.paymentMethod]
    createdAt <- map[SerializationKeys.createdAt]
    finalAmountPaid <- map[SerializationKeys.finalAmountPaid]
    numberOfRider <- map[SerializationKeys.numberOfRider]
    rideOtpVerify <- map[SerializationKeys.rideOtpVerify]
    autoUpgradetion <- map[SerializationKeys.autoUpgradetion]
    dropLongitude <- map[SerializationKeys.dropLongitude]
    bookingType <- map[SerializationKeys.bookingType]
    estimateTime <- map[SerializationKeys.estimateTime]
    ployPoints <- map[SerializationKeys.ployPoints]
    vehicleType <- map[SerializationKeys.vehicleType]
    priceCard <- map[SerializationKeys.priceCard]
    user <- map[SerializationKeys.user]
    updatedAt <- map[SerializationKeys.updatedAt]
    mapImage <- map[SerializationKeys.mapImage]
    travelDistance <- map[SerializationKeys.travelDistance]
    totalDropLocation <- map[SerializationKeys.totalDropLocation]
    travelTime <- map[SerializationKeys.travelTime]
    merchantId <- map[SerializationKeys.merchantId]
    bookingTimestamp <- map[SerializationKeys.bookingTimestamp]
    pickupLatitude <- map[SerializationKeys.pickupLatitude]
    serviceType <- map[SerializationKeys.serviceType]
    travelTimeMin <- map[SerializationKeys.travelTimeMin]
    uniqueId <- map[SerializationKeys.uniqueId]
    driverVehicleId <- map[SerializationKeys.driverVehicleId]
    serviceTypeId <- map[SerializationKeys.serviceTypeId]
    userId <- map[SerializationKeys.userId]
    waypoints <- map[SerializationKeys.waypoints]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = dropLocation { dictionary[SerializationKeys.dropLocation] = value }
    if let value = platform { dictionary[SerializationKeys.platform] = value }
    if let value = pickupLocation { dictionary[SerializationKeys.pickupLocation] = value }
    if let value = promoCode { dictionary[SerializationKeys.promoCode] = value }
    if let value = dropLatitude { dictionary[SerializationKeys.dropLatitude] = value }
    if let value = estimateBill { dictionary[SerializationKeys.estimateBill] = value }
    if let value = vehicleTypeId { dictionary[SerializationKeys.vehicleTypeId] = value }
    if let value = cardId { dictionary[SerializationKeys.cardId] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = estimateDistance { dictionary[SerializationKeys.estimateDistance] = value }
    if let value = paymentStatus { dictionary[SerializationKeys.paymentStatus] = value }
    if let value = priceCardId { dictionary[SerializationKeys.priceCardId] = value }
    if let value = estimateDriverDistnace { dictionary[SerializationKeys.estimateDriverDistnace] = value }
    if let value = pickupLongitude { dictionary[SerializationKeys.pickupLongitude] = value }
    if let value = driverId { dictionary[SerializationKeys.driverId] = value }
    if let value = bookingStatus { dictionary[SerializationKeys.bookingStatus] = value }
    if let value = paymentMethodId { dictionary[SerializationKeys.paymentMethodId] = value }
    if let value = estimateDriverTime { dictionary[SerializationKeys.estimateDriverTime] = value }
    if let value = countryAreaId { dictionary[SerializationKeys.countryAreaId] = value }
    if let value = paymentMethod { dictionary[SerializationKeys.paymentMethod] = value.dictionaryRepresentation() }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = finalAmountPaid { dictionary[SerializationKeys.finalAmountPaid] = value }
    if let value = numberOfRider { dictionary[SerializationKeys.numberOfRider] = value }
    if let value = rideOtpVerify { dictionary[SerializationKeys.rideOtpVerify] = value }
    if let value = autoUpgradetion { dictionary[SerializationKeys.autoUpgradetion] = value }
    if let value = dropLongitude { dictionary[SerializationKeys.dropLongitude] = value }
    if let value = bookingType { dictionary[SerializationKeys.bookingType] = value }
    if let value = estimateTime { dictionary[SerializationKeys.estimateTime] = value }
    if let value = ployPoints { dictionary[SerializationKeys.ployPoints] = value }
    if let value = vehicleType { dictionary[SerializationKeys.vehicleType] = value.dictionaryRepresentation() }
    if let value = priceCard { dictionary[SerializationKeys.priceCard] = value.dictionaryRepresentation() }
    if let value = user { dictionary[SerializationKeys.user] = value.dictionaryRepresentation() }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = mapImage { dictionary[SerializationKeys.mapImage] = value }
    if let value = travelDistance { dictionary[SerializationKeys.travelDistance] = value }
    if let value = totalDropLocation { dictionary[SerializationKeys.totalDropLocation] = value }
    if let value = travelTime { dictionary[SerializationKeys.travelTime] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = bookingTimestamp { dictionary[SerializationKeys.bookingTimestamp] = value }
    if let value = pickupLatitude { dictionary[SerializationKeys.pickupLatitude] = value }
    if let value = serviceType { dictionary[SerializationKeys.serviceType] = value.dictionaryRepresentation() }
    if let value = travelTimeMin { dictionary[SerializationKeys.travelTimeMin] = value }
    if let value = uniqueId { dictionary[SerializationKeys.uniqueId] = value }
    if let value = driverVehicleId { dictionary[SerializationKeys.driverVehicleId] = value }
    if let value = serviceTypeId { dictionary[SerializationKeys.serviceTypeId] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    if let value = waypoints { dictionary[SerializationKeys.waypoints] = value }
    return dictionary
  }

}
