//
//  DriverLocationModel.swift
//
//  Created by Atul Jain on 14/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverLocationModel: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let booking = "booking"
    static let data = "data"
    static let message = "message"
    static let result = "result"
  }

  // MARK: Properties
  public var booking: DriverLocationBooking?
  public var data: DriverLocationData?
  public var message: String?
  public var result: String?

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
    booking <- map[SerializationKeys.booking]
    data <- map[SerializationKeys.data]
    message <- map[SerializationKeys.message]
    result <- map[SerializationKeys.result]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = booking { dictionary[SerializationKeys.booking] = value.dictionaryRepresentation() }
    if let value = data { dictionary[SerializationKeys.data] = value.dictionaryRepresentation() }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = result { dictionary[SerializationKeys.result] = value }
    return dictionary
  }

}
