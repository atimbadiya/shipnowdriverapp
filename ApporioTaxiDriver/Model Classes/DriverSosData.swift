//
//  Data.swift
//
//  Created by apple on 2/13/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverSosData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let bookingId = "booking_id"
    static let latitude = "latitude"
    static let application = "application"
    static let updatedAt = "updated_at"
    static let id = "id"
    static let countryAreaId = "country_area_id"
    static let createdAt = "created_at"
    static let number = "number"
    static let longitude = "longitude"
    static let merchantId = "merchant_id"
  }

  // MARK: Properties
  public var bookingId: String?
  public var latitude: String?
  public var application: Int?
  public var updatedAt: String?
  public var id: Int?
  public var countryAreaId: String?
  public var createdAt: String?
  public var number: String?
  public var longitude: String?
  public var merchantId: String?

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
    bookingId <- map[SerializationKeys.bookingId]
    latitude <- map[SerializationKeys.latitude]
    application <- map[SerializationKeys.application]
    updatedAt <- map[SerializationKeys.updatedAt]
    id <- map[SerializationKeys.id]
    countryAreaId <- map[SerializationKeys.countryAreaId]
    createdAt <- map[SerializationKeys.createdAt]
    number <- map[SerializationKeys.number]
    longitude <- map[SerializationKeys.longitude]
    merchantId <- map[SerializationKeys.merchantId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = bookingId { dictionary[SerializationKeys.bookingId] = value }
    if let value = latitude { dictionary[SerializationKeys.latitude] = value }
    if let value = application { dictionary[SerializationKeys.application] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = countryAreaId { dictionary[SerializationKeys.countryAreaId] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = number { dictionary[SerializationKeys.number] = value }
    if let value = longitude { dictionary[SerializationKeys.longitude] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    return dictionary
  }

}
