//
//  Data.swift
//
//  Created by apple on 2/16/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverHomeAddressData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let addressValue = "address_value"
    static let addressName = "address_name"
    static let id = "id"
    static let checkVisibility = "check_visibility"
  }

  // MARK: Properties
  public var addressValue: String?
  public var addressName: String?
  public var id: Int?
  public var checkVisibility: Bool? = false

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
    addressValue <- map[SerializationKeys.addressValue]
    addressName <- map[SerializationKeys.addressName]
    id <- map[SerializationKeys.id]
    checkVisibility <- map[SerializationKeys.checkVisibility]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = addressValue { dictionary[SerializationKeys.addressValue] = value }
    if let value = addressName { dictionary[SerializationKeys.addressName] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    dictionary[SerializationKeys.checkVisibility] = checkVisibility
    return dictionary
  }

}
