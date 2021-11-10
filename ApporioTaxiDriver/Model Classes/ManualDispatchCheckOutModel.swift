//
//  ManualDispatchCheckOutModel.swift
//
//  Created by Atul Jain on 19/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct ManualDispatchCheckOutModel: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let otp = "otp"
    static let data = "data"
    static let message = "message"
    static let result = "result"
  }

  // MARK: Properties
  public var otp: String?
  public var data: ManualDispatchCheckOutData?
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
    otp <- map[SerializationKeys.otp]
    data <- map[SerializationKeys.data]
    message <- map[SerializationKeys.message]
    result <- map[SerializationKeys.result]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = otp { dictionary[SerializationKeys.otp] = value }
    if let value = data { dictionary[SerializationKeys.data] = value.dictionaryRepresentation() }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = result { dictionary[SerializationKeys.result] = value }
    return dictionary
  }

}
