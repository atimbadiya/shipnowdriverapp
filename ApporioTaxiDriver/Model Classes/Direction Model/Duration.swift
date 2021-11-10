//
//  Duration.swift
//
//  Created by Gyanender on 01/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct Duration: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let text = "text"
    static let value = "value"
  }

  // MARK: Properties
  public var text: String?
  public var value: Int?

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
    text <- map[SerializationKeys.text]
    value <- map[SerializationKeys.value]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = text { dictionary[SerializationKeys.text] = value }
    if let value = value { dictionary[SerializationKeys.value] = value }
    return dictionary
  }

}
