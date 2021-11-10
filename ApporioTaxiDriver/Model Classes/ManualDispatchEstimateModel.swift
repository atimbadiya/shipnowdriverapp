//
//  ManualDispatchEstimateModel.swift
//
//  Created by Gyanender on 18/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct ManualDispatchEstimateModel: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let message = "message"
    static let result = "result"
    static let manualestimatedata = "data"
    static let otpManualDispatch = "otp_manual_dispatch"
  }

  // MARK: Properties
  public var message: String?
  public var result: String?
  public var manualestimatedata: Manualestimatedata?
  public var otpManualDispatch: Bool? = false

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
    message <- map[SerializationKeys.message]
    result <- map[SerializationKeys.result]
    manualestimatedata <- map[SerializationKeys.manualestimatedata]
    otpManualDispatch <- map[SerializationKeys.otpManualDispatch]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = result { dictionary[SerializationKeys.result] = value }
    if let value = manualestimatedata { dictionary[SerializationKeys.manualestimatedata] = value.dictionaryRepresentation() }
    dictionary[SerializationKeys.otpManualDispatch] = otpManualDispatch
    return dictionary
  }

}
