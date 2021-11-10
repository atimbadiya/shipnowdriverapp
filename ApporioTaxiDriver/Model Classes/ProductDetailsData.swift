//
//  ProductDetailsData.swift
//  ApporioTaxiDriver
//
//  Created by apple on 5/8/20.
//  Copyright © 2020 Atul Jain. All rights reserved.
//

import Foundation
import ObjectMapper

public struct ProductDetailsData: Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {

        static let id = "id"
        static let productName = "product_name"
        static let weightUnit = "weight_unit"
        static let quantity = "quantity"
        static let merchantId = "merchant_id"
    }
    
    // MARK: Properties
    public var id: Int?
    public var productName: String?
    public var weightUnit: String?
    public var quantity: String?
    public var merchantId: String?
    
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
        id <- map[SerializationKeys.id]
        productName <- map[SerializationKeys.productName]
        weightUnit <- map[SerializationKeys.weightUnit]
        quantity <- map[SerializationKeys.quantity]
        merchantId <- map[SerializationKeys.merchantId]
        
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = productName { dictionary[SerializationKeys.productName] = value }
        if let value = weightUnit { dictionary[SerializationKeys.weightUnit] = value }
        if let value = quantity { dictionary[SerializationKeys.quantity] = value }
        if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
        return dictionary
    }
    
}

