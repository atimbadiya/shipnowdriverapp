//
//  Data.swift
//
//  Created by apple on 3/7/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverCheckRatingData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let image = "image"
    static let rating = "rating"
     static let firstname = "first_name"
     static let lastname = "last_name"
  }

  // MARK: Properties
  public var name: String?
  public var image: String?
  public var rating: String?
     public var firstname: String?
     public var lastname: String?

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
    image <- map[SerializationKeys.image]
    rating <- map[SerializationKeys.rating]
     firstname <- map[SerializationKeys.firstname]
     lastname <- map[SerializationKeys.lastname]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = image { dictionary[SerializationKeys.image] = value }
    if let value = rating { dictionary[SerializationKeys.rating] = value }
     if let value = firstname { dictionary[SerializationKeys.firstname] = value }
     if let value = lastname { dictionary[SerializationKeys.lastname] = value }
    return dictionary
  }

}
