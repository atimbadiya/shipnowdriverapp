//
//  Holdermeteringdata.swift
//
//  Created by Atul Jain on 20/02/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct RideDetailsHoldermeteringdata: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let textOne = "text_one"
    static let textTwo = "text_two"
    static let textThree = "text_three"
  }

  // MARK: Properties
  public var textOne: String?
  public var textTwo: String?
     public var textThree: String?

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
    textOne <- map[SerializationKeys.textOne]
    textTwo <- map[SerializationKeys.textTwo]
    textThree <- map[SerializationKeys.textThree]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = textOne { dictionary[SerializationKeys.textOne] = value }
    if let value = textTwo { dictionary[SerializationKeys.textTwo] = value }
     if let value = textThree { dictionary[SerializationKeys.textThree] = value }
    return dictionary
  }

}
