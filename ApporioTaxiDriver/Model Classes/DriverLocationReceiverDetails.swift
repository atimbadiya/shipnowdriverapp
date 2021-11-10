//
//  ReceiverDetails.swift
//
//  Created by apple on 5/8/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverLocationReceiverDetails: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let contact = "contact"
    static let name = "name"
  }

  // MARK: Properties
  public var contact: String?
  public var name: String?

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
    contact <- map[SerializationKeys.contact]
    name <- map[SerializationKeys.name]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = contact { dictionary[SerializationKeys.contact] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    return dictionary
  }

}
