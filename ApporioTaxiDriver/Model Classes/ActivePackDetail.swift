//
//  ActivePackDetail.swift
//
//  Created by Atul Jain on 14/10/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct ActivePackDetail: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let name = "name"
        static let showPrice = "show_price"
        static let subscriptionPackage = "subscription_package"
        static let packageDuration = "package_duration"
        static let subscriptionPackId = "subscription_pack_id"
        static let ridesLeft = "rides_left"
        static let descriptionValue = "description"
        static let packageTotalTrips = "package_total_trips"
        static let active = "active"
        static let endDateTime = "end_date_time"
        static let price = "price"
        static let packageDurationName = "package_duration_name"
        static let status = "status"
        static let packageType = "package_type"
        static let paymentMethodId = "payment_method_id"
        static let serviceType = "service_type"
        static let usedTrips = "used_trips"
        static let image = "image"
        static let startDateTime = "start_date_time"
        static let packageDurationId = "package_duration_id"
    }
    
    // MARK: Properties
    public var name: String?
    public var showPrice: String?
    public var subscriptionPackage: SubscriptionPackage?
    public var packageDuration: PackageDuration?
    public var subscriptionPackId: Int?
    public var ridesLeft: Int?
    public var descriptionValue: String?
    public var packageTotalTrips: Int?
    public var active: Bool? = false
    public var endDateTime: String?
    public var price: String?
    public var packageDurationName: String?
    public var status: Int?
    public var packageType: Int?
    public var paymentMethodId: Int?
    public var serviceType: [ServiceType]?
    public var usedTrips: Int?
    public var image: String?
    public var startDateTime: String?
    public var packageDurationId: Int?
    
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
        name <- map[SerializationKeys.name]
        showPrice <- map[SerializationKeys.showPrice]
        subscriptionPackage <- map[SerializationKeys.subscriptionPackage]
        packageDuration <- map[SerializationKeys.packageDuration]
        subscriptionPackId <- map[SerializationKeys.subscriptionPackId]
        ridesLeft <- map[SerializationKeys.ridesLeft]
        descriptionValue <- map[SerializationKeys.descriptionValue]
        packageTotalTrips <- map[SerializationKeys.packageTotalTrips]
        active <- map[SerializationKeys.active]
        endDateTime <- map[SerializationKeys.endDateTime]
        price <- map[SerializationKeys.price]
        packageDurationName <- map[SerializationKeys.packageDurationName]
        status <- map[SerializationKeys.status]
        packageType <- map[SerializationKeys.packageType]
        paymentMethodId <- map[SerializationKeys.paymentMethodId]
        serviceType <- map[SerializationKeys.serviceType]
        usedTrips <- map[SerializationKeys.usedTrips]
        image <- map[SerializationKeys.image]
        startDateTime <- map[SerializationKeys.startDateTime]
        packageDurationId <- map[SerializationKeys.packageDurationId]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = name { dictionary[SerializationKeys.name] = value }
        if let value = showPrice { dictionary[SerializationKeys.showPrice] = value }
        if let value = subscriptionPackage { dictionary[SerializationKeys.subscriptionPackage] = value.dictionaryRepresentation() }
        if let value = packageDuration { dictionary[SerializationKeys.packageDuration] = value.dictionaryRepresentation() }
        if let value = subscriptionPackId { dictionary[SerializationKeys.subscriptionPackId] = value }
        if let value = ridesLeft { dictionary[SerializationKeys.ridesLeft] = value }
        if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
        if let value = packageTotalTrips { dictionary[SerializationKeys.packageTotalTrips] = value }
        dictionary[SerializationKeys.active] = active
        if let value = endDateTime { dictionary[SerializationKeys.endDateTime] = value }
        if let value = price { dictionary[SerializationKeys.price] = value }
        if let value = packageDurationName { dictionary[SerializationKeys.packageDurationName] = value }
        if let value = status { dictionary[SerializationKeys.status] = value }
        if let value = packageType { dictionary[SerializationKeys.packageType] = value }
        if let value = paymentMethodId { dictionary[SerializationKeys.paymentMethodId] = value }
        if let value = serviceType { dictionary[SerializationKeys.serviceType] = value.map { $0.dictionaryRepresentation() } }
        if let value = usedTrips { dictionary[SerializationKeys.usedTrips] = value }
        if let value = image { dictionary[SerializationKeys.image] = value }
        if let value = startDateTime { dictionary[SerializationKeys.startDateTime] = value }
        if let value = packageDurationId { dictionary[SerializationKeys.packageDurationId] = value }
        return dictionary
    }
    
}



//  private struct SerializationKeys {
//    static let name = "name"
//    static let showPrice = "show_price"
//    static let subscriptionPackId = "subscription_pack_id"
//    static let subscriptionPackage = "subscription_package"
//    static let descriptionValue = "description"
//    static let ridesLeft = "rides_left"
//    static let packageTotalTrips = "package_total_trips"
//    static let active = "active"
//    static let endDateTime = "end_date_time"
//    static let price = "price"
//    static let packageDurationName = "package_duration_name"
//    static let status = "status"
//    static let serviceType = "service_type"
//    static let packageType = "package_type"
//    static let paymentMethodId = "payment_method_id"
//    static let usedTrips = "used_trips"
//    static let image = "image"
//    static let startDateTime = "start_date_time"
//    static let packageDurationId = "package_duration_id"
//  }
//
//  // MARK: Properties
//  public var name: String?
//  public var showPrice: String?
//  public var subscriptionPackId: Int?
//  public var subscriptionPackage: SubscriptionPackage?
//  public var descriptionValue: String?
//  public var ridesLeft: Int?
//  public var packageTotalTrips: Int?
//  public var active: Bool? = false
//  public var endDateTime: String?
//  public var price: String?
//  public var packageDurationName: String?
//  public var status: Int?
//  public var serviceType: [ServiceType]?
//  public var packageType: Int?
//  public var paymentMethodId: Int?
//  public var usedTrips: Int?
//  public var image: String?
//  public var startDateTime: String?
//  public var packageDurationId: Int?
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
//    name <- map[SerializationKeys.name]
//    showPrice <- map[SerializationKeys.showPrice]
//    subscriptionPackId <- map[SerializationKeys.subscriptionPackId]
//    subscriptionPackage <- map[SerializationKeys.subscriptionPackage]
//    descriptionValue <- map[SerializationKeys.descriptionValue]
//    ridesLeft <- map[SerializationKeys.ridesLeft]
//    packageTotalTrips <- map[SerializationKeys.packageTotalTrips]
//    active <- map[SerializationKeys.active]
//    endDateTime <- map[SerializationKeys.endDateTime]
//    price <- map[SerializationKeys.price]
//    packageDurationName <- map[SerializationKeys.packageDurationName]
//    status <- map[SerializationKeys.status]
//    serviceType <- map[SerializationKeys.serviceType]
//    packageType <- map[SerializationKeys.packageType]
//    paymentMethodId <- map[SerializationKeys.paymentMethodId]
//    usedTrips <- map[SerializationKeys.usedTrips]
//    image <- map[SerializationKeys.image]
//    startDateTime <- map[SerializationKeys.startDateTime]
//    packageDurationId <- map[SerializationKeys.packageDurationId]
//  }
//
//  /// Generates description of the object in the form of a NSDictionary.
//  ///
//  /// - returns: A Key value pair containing all valid values in the object.
//  public func dictionaryRepresentation() -> [String: Any] {
//    var dictionary: [String: Any] = [:]
//    if let value = name { dictionary[SerializationKeys.name] = value }
//    if let value = showPrice { dictionary[SerializationKeys.showPrice] = value }
//    if let value = subscriptionPackId { dictionary[SerializationKeys.subscriptionPackId] = value }
//    if let value = subscriptionPackage { dictionary[SerializationKeys.subscriptionPackage] = value.dictionaryRepresentation() }
//    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
//    if let value = ridesLeft { dictionary[SerializationKeys.ridesLeft] = value }
//    if let value = packageTotalTrips { dictionary[SerializationKeys.packageTotalTrips] = value }
//    dictionary[SerializationKeys.active] = active
//    if let value = endDateTime { dictionary[SerializationKeys.endDateTime] = value }
//    if let value = price { dictionary[SerializationKeys.price] = value }
//    if let value = packageDurationName { dictionary[SerializationKeys.packageDurationName] = value }
//    if let value = status { dictionary[SerializationKeys.status] = value }
//    if let value = serviceType { dictionary[SerializationKeys.serviceType] = value.map { $0.dictionaryRepresentation() } }
//    if let value = packageType { dictionary[SerializationKeys.packageType] = value }
//    if let value = paymentMethodId { dictionary[SerializationKeys.paymentMethodId] = value }
//    if let value = usedTrips { dictionary[SerializationKeys.usedTrips] = value }
//    if let value = image { dictionary[SerializationKeys.image] = value }
//    if let value = startDateTime { dictionary[SerializationKeys.startDateTime] = value }
//    if let value = packageDurationId { dictionary[SerializationKeys.packageDurationId] = value }
//    return dictionary
//  }
//
//}
