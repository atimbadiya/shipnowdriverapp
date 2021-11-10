//
//  Data.swift
//
//  Created by apple on 2/9/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct RecievedNotificationData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.


    private struct SerializationKeys {
        static let dropLocation = "drop_location"
        static let vehicle = "vehicle"
        static let multipleStopList = "multiple_stop_list"
        static let pickupLocation = "pickup_location"
        static let vehicleimage = "vehicleimage"
        static let dropLatitude = "drop_latitude"
        static let dropLongitude = "drop_longitude"
        static let estimateBill = "estimate_bill"
        static let timestamp = "timestamp"
        static let bookingType = "booking_type"
        static let service = "service"
        static let packageName = "package_name"
        static let estimateDistance = "estimate_distance"
        static let estimateTime = "estimate_time"
        static let phone = "phone"
        static let userImage = "user_image"
        static let bookingId = "booking_id"
        static let email = "email"
        static let pickupLongitude = "pickup_longitude"
        static let outstationMsg = "outstation_msg"
        static let username = "username"
        static let multipleText = "multiple_text"
        static let multipleVisable = "multiple_visable"
        static let bookingStatus = "booking_status"
        static let pickupLatitude = "pickup_latitude"
        static let paymentMethod = "payment_method"
        static let serviceTypeId = "service_type_id"
        static let additionalNotes = "additional_notes"
        static let driverRequestTimeout = "driver_request_timeout"
        static let receiverDetails = "receiver_details"
        static let productDetails = "product_details"
        static let productImages = "product_images"
    }
    
    // MARK: Properties
    public var dropLocation: String?
    public var vehicle: String?
    public var multipleStopList: [MultipleStopList]?
    public var pickupLocation: String?
    public var vehicleimage: String?
    public var dropLatitude: String?
    public var dropLongitude: String?
    public var estimateBill: String?
    public var timestamp: Int?
    public var bookingType: String?
    public var service: String?
    public var packageName: String?
    public var estimateDistance: String?
    public var estimateTime: String?
    public var phone: String?
    public var userImage: String?
    public var bookingId: Int?
    public var email: String?
    public var pickupLongitude: String?
    public var outstationMsg: String?
    public var username: String?
    public var multipleText: String?
    public var multipleVisable: Bool? = false
    public var bookingStatus: Int?
    public var pickupLatitude: String?
    public var paymentMethod: String?
    public var serviceTypeId: Int?
    public var additionalNotes: String?
    public var driverRequestTimeout: Int?
    public var receiverDetails: DriverLocationReceiverDetails?
    public var productDetails: [ProductDetailsData]?
    public var productImages: [String]?
    
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
        vehicle <- map[SerializationKeys.vehicle]
        multipleStopList <- map[SerializationKeys.multipleStopList]
        pickupLocation <- map[SerializationKeys.pickupLocation]
        vehicleimage <- map[SerializationKeys.vehicleimage]
        dropLatitude <- map[SerializationKeys.dropLatitude]
        dropLongitude <- map[SerializationKeys.dropLongitude]
        estimateBill <- map[SerializationKeys.estimateBill]
        timestamp <- map[SerializationKeys.timestamp]
        bookingType <- map[SerializationKeys.bookingType]
        service <- map[SerializationKeys.service]
        packageName <- map[SerializationKeys.packageName]
        estimateDistance <- map[SerializationKeys.estimateDistance]
        estimateTime <- map[SerializationKeys.estimateTime]
        phone <- map[SerializationKeys.phone]
        userImage <- map[SerializationKeys.userImage]
        bookingId <- map[SerializationKeys.bookingId]
        email <- map[SerializationKeys.email]
        pickupLongitude <- map[SerializationKeys.pickupLongitude]
        outstationMsg <- map[SerializationKeys.outstationMsg]
        username <- map[SerializationKeys.username]
        multipleText <- map[SerializationKeys.multipleText]
        multipleVisable <- map[SerializationKeys.multipleVisable]
        bookingStatus <- map[SerializationKeys.bookingStatus]
        pickupLatitude <- map[SerializationKeys.pickupLatitude]
        paymentMethod <- map[SerializationKeys.paymentMethod]
        serviceTypeId <- map[SerializationKeys.serviceTypeId]
        additionalNotes <- map[SerializationKeys.additionalNotes]
        driverRequestTimeout <- map[SerializationKeys.driverRequestTimeout]
        receiverDetails <- map[SerializationKeys.receiverDetails]
        productDetails <- map[SerializationKeys.productDetails]
        productImages <- map[SerializationKeys.productImages]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = dropLocation { dictionary[SerializationKeys.dropLocation] = value }
        if let value = vehicle { dictionary[SerializationKeys.vehicle] = value }
        if let value = multipleStopList { dictionary[SerializationKeys.multipleStopList] = value.map { $0.dictionaryRepresentation() } }
        if let value = pickupLocation { dictionary[SerializationKeys.pickupLocation] = value }
        if let value = vehicleimage { dictionary[SerializationKeys.vehicleimage] = value }
        if let value = dropLatitude { dictionary[SerializationKeys.dropLatitude] = value }
        if let value = dropLongitude { dictionary[SerializationKeys.dropLongitude] = value }
        if let value = estimateBill { dictionary[SerializationKeys.estimateBill] = value }
        if let value = timestamp { dictionary[SerializationKeys.timestamp] = value }
        if let value = bookingType { dictionary[SerializationKeys.bookingType] = value }
        if let value = service { dictionary[SerializationKeys.service] = value }
        if let value = packageName { dictionary[SerializationKeys.packageName] = value }
        if let value = estimateDistance { dictionary[SerializationKeys.estimateDistance] = value }
        if let value = estimateTime { dictionary[SerializationKeys.estimateTime] = value }
        if let value = phone { dictionary[SerializationKeys.phone] = value }
        if let value = userImage { dictionary[SerializationKeys.userImage] = value }
        if let value = bookingId { dictionary[SerializationKeys.bookingId] = value }
        if let value = email { dictionary[SerializationKeys.email] = value }
        if let value = pickupLongitude { dictionary[SerializationKeys.pickupLongitude] = value }
        if let value = outstationMsg { dictionary[SerializationKeys.outstationMsg] = value }
        if let value = username { dictionary[SerializationKeys.username] = value }
        if let value = multipleText { dictionary[SerializationKeys.multipleText] = value }
        dictionary[SerializationKeys.multipleVisable] = multipleVisable
        if let value = bookingStatus { dictionary[SerializationKeys.bookingStatus] = value }
        if let value = pickupLatitude { dictionary[SerializationKeys.pickupLatitude] = value }
        if let value = paymentMethod { dictionary[SerializationKeys.paymentMethod] = value }
        if let value = serviceTypeId { dictionary[SerializationKeys.serviceTypeId] = value }
        if let value = additionalNotes { dictionary[SerializationKeys.additionalNotes] = value }
        if let value = driverRequestTimeout { dictionary[SerializationKeys.driverRequestTimeout] = value }
        if let value = receiverDetails { dictionary[SerializationKeys.receiverDetails] = value.dictionaryRepresentation() }
        if let value = productDetails { dictionary[SerializationKeys.productDetails] = value.map { $0.dictionaryRepresentation() } }
        if let value = productImages { dictionary[SerializationKeys.productImages] = value }
        return dictionary
    }
    
}


//  private struct SerializationKeys {
//    static let bookingId = "booking_id"
//    static let email = "email"
//    static let vehicle = "vehicle"
//    static let dropLocation = "drop_location"
//    static let pickupLocation = "pickup_location"
//    static let vehicleimage = "vehicleimage"
//    static let pickupLongitude = "pickup_longitude"
//    static let dropLatitude = "drop_latitude"
//    static let dropLongitude = "drop_longitude"
//    static let bookingType = "booking_type"
//    static let timestamp = "timestamp"
//    static let username = "username"
//    static let service = "service"
//    static let bookingStatus = "booking_status"
//    static let pickupLatitude = "pickup_latitude"
//    static let paymentMethod = "payment_method"
//    static let packageName = "package_name"
//    static let estimateTime = "estimate_time"
//    static let phone = "phone"
//    static let estimateDistance = "estimate_distance"
//    static let serviceTypeId = "service_type_id"
//    static let userImage = "user_image"
//    static let additionalNotes = "additional_notes"
//    static let driverRequestTimeout = "driver_request_timeout"
//    static let estimateFare = "estimate_bill"
//  }
//
//  // MARK: Properties
//  public var bookingId: Int?
//  public var email: String?
//  public var vehicle: String?
//  public var dropLocation: String?
//  public var pickupLocation: String?
//  public var vehicleimage: String?
//  public var pickupLongitude: String?
//  public var dropLatitude: String?
//  public var dropLongitude: String?
//  public var bookingType: String?
//  public var timestamp: Int?
//  public var username: String?
//  public var service: String?
//  public var bookingStatus: Int?
//  public var pickupLatitude: String?
//  public var paymentMethod: String?
//  public var packageName: String?
//  public var estimateTime: String?
//  public var phone: String?
//  public var estimateDistance: String?
//  public var serviceTypeId: Int?
//  public var userImage: String?
//  public var additionalNotes: String?
//  public var driverRequestTimeout: Int?
//    public var estimateFare: String?
//
//  // MARK: ObjectMapper Initializers
//  /// Map a JSON object to this class using ObjectMapper.
//  ///
//  /// - parameter map: A mapping from ObjectMapper.
//  public init?(map: Map){
//
//  }
//
//  /// Map a JSON object to this class using ObjectMapper.
//  ///
//  /// - parameter map: A mapping from ObjectMapper.
//  public mutating func mapping(map: Map) {
//    bookingId <- map[SerializationKeys.bookingId]
//    email <- map[SerializationKeys.email]
//    vehicle <- map[SerializationKeys.vehicle]
//    dropLocation <- map[SerializationKeys.dropLocation]
//    pickupLocation <- map[SerializationKeys.pickupLocation]
//    vehicleimage <- map[SerializationKeys.vehicleimage]
//    pickupLongitude <- map[SerializationKeys.pickupLongitude]
//    dropLatitude <- map[SerializationKeys.dropLatitude]
//    dropLongitude <- map[SerializationKeys.dropLongitude]
//    bookingType <- map[SerializationKeys.bookingType]
//    timestamp <- map[SerializationKeys.timestamp]
//    username <- map[SerializationKeys.username]
//    service <- map[SerializationKeys.service]
//    bookingStatus <- map[SerializationKeys.bookingStatus]
//    pickupLatitude <- map[SerializationKeys.pickupLatitude]
//    paymentMethod <- map[SerializationKeys.paymentMethod]
//    packageName <- map[SerializationKeys.packageName]
//    estimateTime <- map[SerializationKeys.estimateTime]
//    phone <- map[SerializationKeys.phone]
//    estimateDistance <- map[SerializationKeys.estimateDistance]
//    serviceTypeId <- map[SerializationKeys.serviceTypeId]
//    userImage <- map[SerializationKeys.userImage]
//    additionalNotes <- map[SerializationKeys.additionalNotes]
//    driverRequestTimeout <- map[SerializationKeys.driverRequestTimeout]
//    estimateFare <- map[SerializationKeys.estimateFare]
//  }
//
//  /// Generates description of the object in the form of a NSDictionary.
//  ///
//  /// - returns: A Key value pair containing all valid values in the object.
//  public func dictionaryRepresentation() -> [String: Any] {
//    var dictionary: [String: Any] = [:]
//    if let value = bookingId { dictionary[SerializationKeys.bookingId] = value }
//    if let value = email { dictionary[SerializationKeys.email] = value }
//    if let value = vehicle { dictionary[SerializationKeys.vehicle] = value }
//    if let value = dropLocation { dictionary[SerializationKeys.dropLocation] = value }
//    if let value = pickupLocation { dictionary[SerializationKeys.pickupLocation] = value }
//    if let value = vehicleimage { dictionary[SerializationKeys.vehicleimage] = value }
//    if let value = pickupLongitude { dictionary[SerializationKeys.pickupLongitude] = value }
//    if let value = dropLatitude { dictionary[SerializationKeys.dropLatitude] = value }
//    if let value = dropLongitude { dictionary[SerializationKeys.dropLongitude] = value }
//    if let value = bookingType { dictionary[SerializationKeys.bookingType] = value }
//    if let value = timestamp { dictionary[SerializationKeys.timestamp] = value }
//    if let value = username { dictionary[SerializationKeys.username] = value }
//    if let value = service { dictionary[SerializationKeys.service] = value }
//    if let value = bookingStatus { dictionary[SerializationKeys.bookingStatus] = value }
//    if let value = pickupLatitude { dictionary[SerializationKeys.pickupLatitude] = value }
//    if let value = paymentMethod { dictionary[SerializationKeys.paymentMethod] = value }
//    if let value = packageName { dictionary[SerializationKeys.packageName] = value }
//    if let value = estimateTime { dictionary[SerializationKeys.estimateTime] = value }
//    if let value = phone { dictionary[SerializationKeys.phone] = value }
//    if let value = estimateDistance { dictionary[SerializationKeys.estimateDistance] = value }
//    if let value = serviceTypeId { dictionary[SerializationKeys.serviceTypeId] = value }
//    if let value = userImage { dictionary[SerializationKeys.userImage] = value }
//    if let value = additionalNotes { dictionary[SerializationKeys.additionalNotes] = value }
//    if let value = driverRequestTimeout { dictionary[SerializationKeys.driverRequestTimeout] = value }
//    if let value = estimateFare { dictionary[SerializationKeys.estimateFare] = value }
//    return dictionary
//  }
//
//}
