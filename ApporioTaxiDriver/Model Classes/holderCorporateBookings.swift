//
//  holderCorporateBookings.swift
//  ApporioTaxiDriver
//
//  Created by Ship Now 2 on 4/10/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import Foundation
import ObjectMapper

public struct holderCorporateBookings: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let visibility = "visibility"
    static let tracking_id = "tracking_id"
    static let scanned_product = "scanned_product"
      static let product = "product"
      static let name = "name"
  }

  // MARK: Properties
  public var visibility: Bool?
  public var tracking_id: String?
  public var scanned_product: String?
    public var product: String?
    public var name: String?


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
      tracking_id <- map[SerializationKeys.tracking_id]
      scanned_product <- map[SerializationKeys.scanned_product]
      product <- map[SerializationKeys.product]
      name <- map[SerializationKeys.name]

  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = visibility { dictionary[SerializationKeys.visibility] = value }
    if let value = tracking_id { dictionary[SerializationKeys.tracking_id] = value }
    if let value = scanned_product { dictionary[SerializationKeys.scanned_product] = value }
      if let value = product { dictionary[SerializationKeys.product] = value }
      if let value = name { dictionary[SerializationKeys.name] = value }

    return dictionary
  }
}
