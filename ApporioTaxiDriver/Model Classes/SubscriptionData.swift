//
//  Data.swift
//
//  Created by Atul Jain on 14/10/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct SubscriptionData: Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let packageType = "package_type"
        static let serviceType = "service_type"
        static let showPrice = "show_price"
        static let id = "id"
        static let image = "image"
        static let expireDate = "expire_date"
        static let maxTrip = "max_trip"
        static let descriptionValue = "description"
        static let name = "name"
        static let price = "price"
        static let merchantId = "merchant_id"
        static let packageDurationName = "package_duration_name"
    }
    
    // MARK: Properties
    public var packageType: Int?
    public var serviceType: [ServiceType]?
    public var showPrice: String?
    public var id: Int?
    public var image: String?
    public var expireDate: String?
    public var maxTrip: Int?
    public var descriptionValue: String?
    public var name: String?
    public var price: String?
    public var merchantId: Int?
    public var packageDurationName: String?
    
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
        packageType <- map[SerializationKeys.packageType]
        serviceType <- map[SerializationKeys.serviceType]
        showPrice <- map[SerializationKeys.showPrice]
        id <- map[SerializationKeys.id]
        image <- map[SerializationKeys.image]
        expireDate <- map[SerializationKeys.expireDate]
        maxTrip <- map[SerializationKeys.maxTrip]
        descriptionValue <- map[SerializationKeys.descriptionValue]
        name <- map[SerializationKeys.name]
        price <- map[SerializationKeys.price]
        merchantId <- map[SerializationKeys.merchantId]
        packageDurationName <- map[SerializationKeys.packageDurationName]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = packageType { dictionary[SerializationKeys.packageType] = value }
        if let value = serviceType { dictionary[SerializationKeys.serviceType] = value.map { $0.dictionaryRepresentation() } }
        if let value = showPrice { dictionary[SerializationKeys.showPrice] = value }
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = image { dictionary[SerializationKeys.image] = value }
        if let value = expireDate { dictionary[SerializationKeys.expireDate] = value }
        if let value = maxTrip { dictionary[SerializationKeys.maxTrip] = value }
        if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
        if let value = name { dictionary[SerializationKeys.name] = value }
        if let value = price { dictionary[SerializationKeys.price] = value }
        if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
        if let value = packageDurationName { dictionary[SerializationKeys.packageDurationName] = value }
        return dictionary
    }
    
}
