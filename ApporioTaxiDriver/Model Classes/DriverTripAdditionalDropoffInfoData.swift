//
//  DriverTripAdditionalDropoffInfoModel.swift
//  ApporioTaxiDriver
//
//  Created by Ship Now 2 on 1/11/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverTripAdditionalDropoffInfoData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let operation_message = "operation_message"
    static let customer_message = "customer_message"
    static let customer_images = "customer_images"
      static let corporate_information = "corporate_information"
  }

  // MARK: Properties
    public var operation_message: String?
    public var customer_message: String?
    public var customer_images: String?
    public var corporate_information: String?


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
      operation_message <- map[SerializationKeys.operation_message]
      customer_message <- map[SerializationKeys.customer_message]
      customer_images <- map[SerializationKeys.customer_images]
      corporate_information <- map[SerializationKeys.corporate_information]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = operation_message { dictionary[SerializationKeys.operation_message] = value }
    if let value = customer_message { dictionary[SerializationKeys.customer_message] = value }
    if let value = customer_images { dictionary[SerializationKeys.customer_images] = value }
      if let value = corporate_information { dictionary[SerializationKeys.corporate_information] = value }

    return dictionary
  }
}
