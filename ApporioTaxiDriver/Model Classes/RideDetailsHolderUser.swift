//
//  HolderUser.swift
//
//  Created by Atul Jain on 20/02/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct RideDetailsHolderUser: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let visibility = "visibility"
    static let holderuserdata = "data"
  }

  // MARK: Properties
  public var visibility: Bool? = false
  public var holderuserdata: RideDetailsHolderuserdata?

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
    visibility <- map[SerializationKeys.visibility]
    holderuserdata <- map[SerializationKeys.holderuserdata]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.visibility] = visibility
    if let value = holderuserdata { dictionary[SerializationKeys.holderuserdata] = value.dictionaryRepresentation() }
    return dictionary
  }

}
