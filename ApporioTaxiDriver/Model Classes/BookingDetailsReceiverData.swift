//
//  BookingDetailsReceiverData.swift
//  ApporioTaxiDriver
//
//  Created by apple on 5/8/20.
//  Copyright © 2020 Atul Jain. All rights reserved.
//

import Foundation
import ObjectMapper

public struct BookingDetailsReceiverData: Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let name = "name"
        static let contact = "contact"
    }
    
    // MARK: Properties
    public var name: String?
    public var contact: String?
    
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
        contact <- map[SerializationKeys.contact]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = name { dictionary[SerializationKeys.name] = value }
        if let value = contact { dictionary[SerializationKeys.contact] = value }
        return dictionary
    }
    
}

