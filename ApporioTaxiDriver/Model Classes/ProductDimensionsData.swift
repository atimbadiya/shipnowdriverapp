//
//  ProductDimensionsData.swift
//  ApporioTaxiDriver
//
//  Created by Ship Now 2 on 9/11/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import Foundation
import ObjectMapper

public struct ProductDimensionsData: Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {

        static let width = "width"
        static let length = "length"
        static let height = "height"
        static let weight = "weight"
    }
    
    // MARK: Properties
    public var width: String?
    public var length: String?
    public var height: String?
    public var weight: String?
    
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
        width <- map[SerializationKeys.width]
        length <- map[SerializationKeys.length]
        height <- map[SerializationKeys.height]
        weight <- map[SerializationKeys.weight]
        
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = width { dictionary[SerializationKeys.width] = value }
        if let value = length { dictionary[SerializationKeys.length] = value }
        if let value = height { dictionary[SerializationKeys.height] = value }
        if let value = weight { dictionary[SerializationKeys.weight] = value }
        return dictionary
    }
    
}

