//
//  ProductListDetails.swift
//  ApporioTaxiDriver
//
//  Created by Ship Now 2 on 9/11/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import Foundation
import ObjectMapper

public struct ProductListDetails: Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {

        static let name = "name"
        static let sku = "sku"
        static let quantity = "quantity"
        static let product_details = "product_details"
    }
    
    // MARK: Properties
    public var name: String?
    public var sku: String?
    public var quantity: String?
    public var product_details: [ProductDimensionsData]?
    
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
        sku <- map[SerializationKeys.sku]
        quantity <- map[SerializationKeys.quantity]
        product_details <- map[SerializationKeys.product_details]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = name { dictionary[SerializationKeys.name] = value }
        if let value = sku { dictionary[SerializationKeys.sku] = value }
        if let value = quantity { dictionary[SerializationKeys.quantity] = value }
        if let value = product_details { dictionary[SerializationKeys.product_details] = value.map { $0.dictionaryRepresentation() } }
        return dictionary
    }
    
}
