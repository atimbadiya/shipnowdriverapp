//
//  Detail.swift
//
//  Created by apple on 2/15/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverEarningsDetail: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let details = "details"
    static let date = "date"
    static let day = "day"
  }

  // MARK: Properties
  public var details: DriverEarningSecondDetails?
  public var date: String?
  public var day: String?

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
    details <- map[SerializationKeys.details]
    date <- map[SerializationKeys.date]
    day <- map[SerializationKeys.day]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = details { dictionary[SerializationKeys.details] = value.dictionaryRepresentation() }
    if let value = date { dictionary[SerializationKeys.date] = value }
    if let value = day { dictionary[SerializationKeys.day] = value }
    return dictionary
  }

}
