//
//  HolderFamilyMember.swift
//
//  Created by Atul Jain on 10/09/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct HolderFamilyMember: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let phoneNumber = "phoneNumber"
    static let name = "name"
    static let age = "age"
  }

  // MARK: Properties
  public var phoneNumber: String?
  public var name: String?
  public var age: String?

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
    phoneNumber <- map[SerializationKeys.phoneNumber]
    name <- map[SerializationKeys.name]
    age <- map[SerializationKeys.age]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = phoneNumber { dictionary[SerializationKeys.phoneNumber] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = age { dictionary[SerializationKeys.age] = value }
    return dictionary
  }

}
