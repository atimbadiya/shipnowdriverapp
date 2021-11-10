//
//  Data.swift
//
//  Created by apple on 2/13/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverDropChangeData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let user = "user"
    static let sos = "sos"
    static let sendMeterImage = "send_meter_image"
    static let rideOtpVerify = "ride_otp_verify"
    static let movableMarker = "movable_marker"
    static let sendMeterValue = "send_meter_value"
    static let pickupLongitude = "pickup_longitude"
    static let driver = "driver"
    static let driverId = "driver_id"
    static let stillMarker = "still_marker"
    static let totalDropLocation = "total_drop_location"
    static let sosVisibility = "sos_visibility"
    static let cancelable = "cancelable"
    static let location = "location"
    static let polydata = "polydata"
    static let id = "id"
    static let paymentMethod = "payment_method"
    static let bookingStatus = "booking_status"
    static let pickupLatitude = "pickup_latitude"
    static let ployPoints = "ploy_points"
    static let serviceTypeId = "service_type_id"
  }

  // MARK: Properties
  public var user: DriverDropChangeUser?
  public var sos: [Any]?
  public var sendMeterImage: Bool? = false
  public var rideOtpVerify: Int?
  public var movableMarker: DriverDropChangeMovableMarker?
  public var sendMeterValue: Bool? = false
  public var pickupLongitude: String?
  public var driver: DriverDropChangeDriver?
  public var driverId: String?
  public var stillMarker: DriverDropChangeStillMarker?
  public var totalDropLocation: String?
  public var sosVisibility: Bool? = false
  public var cancelable: Bool? = false
  public var location: DriverDropChangeLocation?
  public var polydata: DriverDropChangePolydata?
  public var id: Int?
  public var paymentMethod: DriverDropChangePaymentMethod?
  public var bookingStatus: Int?
  public var pickupLatitude: String?
  public var ployPoints: String?
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
    user <- map[SerializationKeys.user]
    sos <- map[SerializationKeys.sos]
    sendMeterImage <- map[SerializationKeys.sendMeterImage]
    rideOtpVerify <- map[SerializationKeys.rideOtpVerify]
    movableMarker <- map[SerializationKeys.movableMarker]
    sendMeterValue <- map[SerializationKeys.sendMeterValue]
    pickupLongitude <- map[SerializationKeys.pickupLongitude]
    driver <- map[SerializationKeys.driver]
    driverId <- map[SerializationKeys.driverId]
    stillMarker <- map[SerializationKeys.stillMarker]
    totalDropLocation <- map[SerializationKeys.totalDropLocation]
    sosVisibility <- map[SerializationKeys.sosVisibility]
    cancelable <- map[SerializationKeys.cancelable]
    location <- map[SerializationKeys.location]
    polydata <- map[SerializationKeys.polydata]
    id <- map[SerializationKeys.id]
    paymentMethod <- map[SerializationKeys.paymentMethod]
    bookingStatus <- map[SerializationKeys.bookingStatus]
    pickupLatitude <- map[SerializationKeys.pickupLatitude]
    ployPoints <- map[SerializationKeys.ployPoints]
    serviceTypeId <- map[SerializationKeys.serviceTypeId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = user { dictionary[SerializationKeys.user] = value.dictionaryRepresentation() }
    if let value = sos { dictionary[SerializationKeys.sos] = value }
    dictionary[SerializationKeys.sendMeterImage] = sendMeterImage
    if let value = rideOtpVerify { dictionary[SerializationKeys.rideOtpVerify] = value }
    if let value = movableMarker { dictionary[SerializationKeys.movableMarker] = value.dictionaryRepresentation() }
    dictionary[SerializationKeys.sendMeterValue] = sendMeterValue
    if let value = pickupLongitude { dictionary[SerializationKeys.pickupLongitude] = value }
    if let value = driver { dictionary[SerializationKeys.driver] = value.dictionaryRepresentation() }
    if let value = driverId { dictionary[SerializationKeys.driverId] = value }
    if let value = stillMarker { dictionary[SerializationKeys.stillMarker] = value.dictionaryRepresentation() }
    if let value = totalDropLocation { dictionary[SerializationKeys.totalDropLocation] = value }
    dictionary[SerializationKeys.sosVisibility] = sosVisibility
    dictionary[SerializationKeys.cancelable] = cancelable
    if let value = location { dictionary[SerializationKeys.location] = value.dictionaryRepresentation() }
    if let value = polydata { dictionary[SerializationKeys.polydata] = value.dictionaryRepresentation() }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = paymentMethod { dictionary[SerializationKeys.paymentMethod] = value.dictionaryRepresentation() }
    if let value = bookingStatus { dictionary[SerializationKeys.bookingStatus] = value }
    if let value = pickupLatitude { dictionary[SerializationKeys.pickupLatitude] = value }
    if let value = ployPoints { dictionary[SerializationKeys.ployPoints] = value }
    if let value = serviceTypeId { dictionary[SerializationKeys.serviceTypeId] = value }
    return dictionary
  }

}
