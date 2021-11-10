//
//  Data.swift
//
//  Created by apple on 2/13/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverRatingData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let bookingId = "booking_id"
    static let driverComment = "driver_comment"
    static let id = "id"
    static let updatedAt = "updated_at"
    static let createdAt = "created_at"
    static let driverRatingPoints = "driver_rating_points"
  }

  // MARK: Properties
  public var bookingId: String?
  public var driverComment: String?
  public var id: Int?
  public var updatedAt: String?
  public var createdAt: String?
  public var driverRatingPoints: String?

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
    driverComment <- map[SerializationKeys.driverComment]
    id <- map[SerializationKeys.id]
    updatedAt <- map[SerializationKeys.updatedAt]
    createdAt <- map[SerializationKeys.createdAt]
    driverRatingPoints <- map[SerializationKeys.driverRatingPoints]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = bookingId { dictionary[SerializationKeys.bookingId] = value }
    if let value = driverComment { dictionary[SerializationKeys.driverComment] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = driverRatingPoints { dictionary[SerializationKeys.driverRatingPoints] = value }
    return dictionary
  }

}
