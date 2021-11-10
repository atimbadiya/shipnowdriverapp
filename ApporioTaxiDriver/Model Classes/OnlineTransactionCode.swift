//
//  OnlineTransactionCode.swift
//
//  Created by Atul Jain on 03/04/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class OnlineTransactionCode: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let placeholder = "placeholder"
    static let name = "name"
  }

  // MARK: Properties
  public var placeholder: String?
  public var name: String?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public required init?(map: Map){

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
    
    public func mapping(map: Map) {
 
    placeholder <- map[SerializationKeys.placeholder]
    name <- map[SerializationKeys.name]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = placeholder { dictionary[SerializationKeys.placeholder] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    return dictionary
  }

}
