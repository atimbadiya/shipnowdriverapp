//
//  Data.swift
//
//  Created by apple on 2/4/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverOtpData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let otp = "otp"
    static let autoFill = "auto_fill"
  }

  // MARK: Properties
  public var otp: String?
  public var autoFill: Bool? = false

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
    autoFill <- map[SerializationKeys.autoFill]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = otp { dictionary[SerializationKeys.otp] = value }
    dictionary[SerializationKeys.autoFill] = autoFill
    return dictionary
  }

}
