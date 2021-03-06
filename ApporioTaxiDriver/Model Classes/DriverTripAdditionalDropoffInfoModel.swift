//
//  DriverTripAdditionalDropoffInfoModel.swift
//  ApporioTaxiDriver
//
//  Created by Ship Now 2 on 1/11/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverTripAdditionalDropoffInfoModel : Mappable{
    private struct SerializationKeys {
      static let result = "result"
      static let data = "data"
      static let message = "message"
    }

    // MARK: Properties
    public var result: String?
    public var data: DriverTripAdditionalDropoffInfoData?
    public var message: String?

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
      result <- map[SerializationKeys.result]
      data <- map[SerializationKeys.data]
      message <- map[SerializationKeys.message]
    }

    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
      var dictionary: [String: Any] = [:]
      if let value = result { dictionary[SerializationKeys.result] = value }
        if let value = data { dictionary[SerializationKeys.data] = value.dictionaryRepresentation()}
      if let value = message { dictionary[SerializationKeys.message] = value }
      return dictionary
    }
    
}
