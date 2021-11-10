//
//  DriverCommissionChoices.swift
//
//  Created by Atul Jain on 03/05/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverCommissionChoices: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let id = "id"
    static let langData = "lang_data"
  }

  // MARK: Properties
  public var id: Int?
  public var langData: String?

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
    langData <- map[SerializationKeys.langData]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = langData { dictionary[SerializationKeys.langData] = value }
    return dictionary
  }

}
