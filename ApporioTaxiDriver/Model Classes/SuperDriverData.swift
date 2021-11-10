//
//  Data.swift
//
//  Created by apple on 3/2/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct SuperDriverData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let dropLocation = "drop_location"
    static let platform = "platform"
    static let pickupLocation = "pickup_location"
    static let promoCode = "promo_code"
    static let driver = "driver"
    static let estimateBill = "estimate_bill"
    static let dropLatitude = "drop_latitude"
    static let vehicleTypeId = "vehicle_type_id"
    static let cardId = "card_id"
    static let id = "id"
    static let estimateDistance = "estimate_distance"
    static let paymentStatus = "payment_status"
    static let bookingClosure = "booking_closure"
    static let priceCardId = "price_card_id"
    static let estimateDriverDistnace = "estimate_driver_distnace"
    static let rideOtp = "ride_otp"
    static let pickupLongitude = "pickup_longitude"
    static let driverId = "driver_id"
    static let bookingStatus = "booking_status"
    static let paymentMethodId = "payment_method_id"
    static let estimateDriverTime = "estimate_driver_time"
    static let countryAreaId = "country_area_id"
    static let createdAt = "created_at"
    static let finalAmountPaid = "final_amount_paid"
    static let companyCut = "company_cut"
    static let numberOfRider = "number_of_rider"
    static let rideOtpVerify = "ride_otp_verify"
    static let autoUpgradetion = "auto_upgradetion"
    static let dropLongitude = "drop_longitude"
    static let bookingType = "booking_type"
    static let driverCut = "driver_cut"
    static let estimateTime = "estimate_time"
    static let ployPoints = "ploy_points"
    static let totalbooking = "totalbooking"
    static let updatedAt = "updated_at"
    static let mapImage = "map_image"
    static let travelDistance = "travel_distance"
    static let totalDropLocation = "total_drop_location"
    static let travelTime = "travel_time"
    static let merchantId = "merchant_id"
    static let bookingTimestamp = "booking_timestamp"
    static let pickupLatitude = "pickup_latitude"
    static let travelTimeMin = "travel_time_min"
    static let uniqueId = "unique_id"
    static let driverVehicleId = "driver_vehicle_id"
    static let serviceTypeId = "service_type_id"
    static let userId = "user_id"
    static let waypoints = "waypoints"
  }

  // MARK: Properties
  public var dropLocation: String?
  public var platform: Int?
  public var pickupLocation: String?
  public var promoCode: String?
  public var driver: SuperDriverDriver?
  public var estimateBill: String?
  public var dropLatitude: String?
  public var vehicleTypeId: Int?
  public var cardId: String?
  public var id: Int?
  public var estimateDistance: String?
  public var paymentStatus: Int?
  public var bookingClosure: Int?
  public var priceCardId: Int?
  public var estimateDriverDistnace: String?
  public var rideOtp: String?
  public var pickupLongitude: String?
  public var driverId: Int?
  public var bookingStatus: Int?
  public var paymentMethodId: Int?
  public var estimateDriverTime: String?
  public var countryAreaId: Int?
  public var createdAt: String?
  public var finalAmountPaid: String?
  public var companyCut: String?
  public var numberOfRider: Int?
  public var rideOtpVerify: Int?
  public var autoUpgradetion: Int?
  public var dropLongitude: String?
  public var bookingType: String?
  public var driverCut: String?
  public var estimateTime: String?
  public var ployPoints: String?
  public var totalbooking: Int?
  public var updatedAt: String?
  public var mapImage: String?
  public var travelDistance: String?
  public var totalDropLocation: Int?
  public var travelTime: String?
  public var merchantId: Int?
  public var bookingTimestamp: String?
  public var pickupLatitude: String?
  public var travelTimeMin: String?
  public var uniqueId: String?
  public var driverVehicleId: Int?
  public var serviceTypeId: Int?
  public var userId: Int?
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
    driver <- map[SerializationKeys.driver]
    estimateBill <- map[SerializationKeys.estimateBill]
    dropLatitude <- map[SerializationKeys.dropLatitude]
    vehicleTypeId <- map[SerializationKeys.vehicleTypeId]
    cardId <- map[SerializationKeys.cardId]
    id <- map[SerializationKeys.id]
    estimateDistance <- map[SerializationKeys.estimateDistance]
    paymentStatus <- map[SerializationKeys.paymentStatus]
    bookingClosure <- map[SerializationKeys.bookingClosure]
    priceCardId <- map[SerializationKeys.priceCardId]
    estimateDriverDistnace <- map[SerializationKeys.estimateDriverDistnace]
    rideOtp <- map[SerializationKeys.rideOtp]
    pickupLongitude <- map[SerializationKeys.pickupLongitude]
    driverId <- map[SerializationKeys.driverId]
    bookingStatus <- map[SerializationKeys.bookingStatus]
    paymentMethodId <- map[SerializationKeys.paymentMethodId]
    estimateDriverTime <- map[SerializationKeys.estimateDriverTime]
    countryAreaId <- map[SerializationKeys.countryAreaId]
    createdAt <- map[SerializationKeys.createdAt]
    finalAmountPaid <- map[SerializationKeys.finalAmountPaid]
    companyCut <- map[SerializationKeys.companyCut]
    numberOfRider <- map[SerializationKeys.numberOfRider]
    rideOtpVerify <- map[SerializationKeys.rideOtpVerify]
    autoUpgradetion <- map[SerializationKeys.autoUpgradetion]
    dropLongitude <- map[SerializationKeys.dropLongitude]
    bookingType <- map[SerializationKeys.bookingType]
    driverCut <- map[SerializationKeys.driverCut]
    estimateTime <- map[SerializationKeys.estimateTime]
    ployPoints <- map[SerializationKeys.ployPoints]
    totalbooking <- map[SerializationKeys.totalbooking]
    updatedAt <- map[SerializationKeys.updatedAt]
    mapImage <- map[SerializationKeys.mapImage]
    travelDistance <- map[SerializationKeys.travelDistance]
    totalDropLocation <- map[SerializationKeys.totalDropLocation]
    travelTime <- map[SerializationKeys.travelTime]
    merchantId <- map[SerializationKeys.merchantId]
    bookingTimestamp <- map[SerializationKeys.bookingTimestamp]
    pickupLatitude <- map[SerializationKeys.pickupLatitude]
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
    if let value = driver { dictionary[SerializationKeys.driver] = value.dictionaryRepresentation() }
    if let value = estimateBill { dictionary[SerializationKeys.estimateBill] = value }
    if let value = dropLatitude { dictionary[SerializationKeys.dropLatitude] = value }
    if let value = vehicleTypeId { dictionary[SerializationKeys.vehicleTypeId] = value }
    if let value = cardId { dictionary[SerializationKeys.cardId] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = estimateDistance { dictionary[SerializationKeys.estimateDistance] = value }
    if let value = paymentStatus { dictionary[SerializationKeys.paymentStatus] = value }
    if let value = bookingClosure { dictionary[SerializationKeys.bookingClosure] = value }
    if let value = priceCardId { dictionary[SerializationKeys.priceCardId] = value }
    if let value = estimateDriverDistnace { dictionary[SerializationKeys.estimateDriverDistnace] = value }
    if let value = rideOtp { dictionary[SerializationKeys.rideOtp] = value }
    if let value = pickupLongitude { dictionary[SerializationKeys.pickupLongitude] = value }
    if let value = driverId { dictionary[SerializationKeys.driverId] = value }
    if let value = bookingStatus { dictionary[SerializationKeys.bookingStatus] = value }
    if let value = paymentMethodId { dictionary[SerializationKeys.paymentMethodId] = value }
    if let value = estimateDriverTime { dictionary[SerializationKeys.estimateDriverTime] = value }
    if let value = countryAreaId { dictionary[SerializationKeys.countryAreaId] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = finalAmountPaid { dictionary[SerializationKeys.finalAmountPaid] = value }
    if let value = companyCut { dictionary[SerializationKeys.companyCut] = value }
    if let value = numberOfRider { dictionary[SerializationKeys.numberOfRider] = value }
    if let value = rideOtpVerify { dictionary[SerializationKeys.rideOtpVerify] = value }
    if let value = autoUpgradetion { dictionary[SerializationKeys.autoUpgradetion] = value }
    if let value = dropLongitude { dictionary[SerializationKeys.dropLongitude] = value }
    if let value = bookingType { dictionary[SerializationKeys.bookingType] = value }
    if let value = driverCut { dictionary[SerializationKeys.driverCut] = value }
    if let value = estimateTime { dictionary[SerializationKeys.estimateTime] = value }
    if let value = ployPoints { dictionary[SerializationKeys.ployPoints] = value }
    if let value = totalbooking { dictionary[SerializationKeys.totalbooking] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = mapImage { dictionary[SerializationKeys.mapImage] = value }
    if let value = travelDistance { dictionary[SerializationKeys.travelDistance] = value }
    if let value = totalDropLocation { dictionary[SerializationKeys.totalDropLocation] = value }
    if let value = travelTime { dictionary[SerializationKeys.travelTime] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = bookingTimestamp { dictionary[SerializationKeys.bookingTimestamp] = value }
    if let value = pickupLatitude { dictionary[SerializationKeys.pickupLatitude] = value }
    if let value = travelTimeMin { dictionary[SerializationKeys.travelTimeMin] = value }
    if let value = uniqueId { dictionary[SerializationKeys.uniqueId] = value }
    if let value = driverVehicleId { dictionary[SerializationKeys.driverVehicleId] = value }
    if let value = serviceTypeId { dictionary[SerializationKeys.serviceTypeId] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    if let value = waypoints { dictionary[SerializationKeys.waypoints] = value }
    return dictionary
  }

}
