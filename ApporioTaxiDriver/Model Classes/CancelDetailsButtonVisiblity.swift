//
//  File.swift
//  ApporioTaxiDriver
//
//  Created by apple on 4/2/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import Foundation
import ObjectMapper

public struct CancelDetailsButtonVisiblity: Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let buttonText = "button_text"
        static let textColor = "text_color"
        static let action = "action"
        static let visibility = "visibility"
        static let textBackGround = "text_back_ground"
    }
    
    // MARK: Properties
    public var buttonText: String?
    public var textColor: String?
    public var action: String?
    public var visibility: Bool? = false
    public var textBackGround: String?
    
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
        buttonText <- map[SerializationKeys.buttonText]
        textColor <- map[SerializationKeys.textColor]
        action <- map[SerializationKeys.action]
        visibility <- map[SerializationKeys.visibility]
        textBackGround <- map[SerializationKeys.textBackGround]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = buttonText { dictionary[SerializationKeys.buttonText] = value }
        if let value = textColor { dictionary[SerializationKeys.textColor] = value }
        if let value = action { dictionary[SerializationKeys.action] = value }
        dictionary[SerializationKeys.visibility] = visibility
        if let value = textBackGround { dictionary[SerializationKeys.textBackGround] = value }
        return dictionary
    }
    
}
