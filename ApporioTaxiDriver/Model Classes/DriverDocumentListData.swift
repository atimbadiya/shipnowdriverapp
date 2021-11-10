//
//  Data.swift
//
//  Created by Atul Jain on 18/02/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverDocumentListData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let vehicle = "vehicle"
    static let docinfo = "docinfo"
    static let personal = "personal"
  }

  // MARK: Properties
  public var vehicle: [DriverDocumentListVehicle]?
  public var docinfo: DriverDocumentListDocinfo?
  public var personal: [DriverDocumentListPersonal]?

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
    vehicle <- map[SerializationKeys.vehicle]
    docinfo <- map[SerializationKeys.docinfo]
    personal <- map[SerializationKeys.personal]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = vehicle { dictionary[SerializationKeys.vehicle] = value.map { $0.dictionaryRepresentation() } }
    if let value = docinfo { dictionary[SerializationKeys.docinfo] = value.dictionaryRepresentation() }
    if let value = personal { dictionary[SerializationKeys.personal] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
