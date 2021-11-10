//
//  Data.swift
//
//  Created by Atul Jain on 02/07/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct ListenTrackingData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let bookingId = "booking_id"
    static let bookingStatus = "booking_status"
    static let estimateDriverTime = "estimate_driver_time"
    static let stillLongitude = "still_longitude"
    static let stillLatitude = "still_latitude"
    static let movableLongitude = "movable_longitude"
    static let movableLatitude = "movable_latitude"
    static let polyPoints = "poly_points"
    static let bearing = "bearing"
    static let driverId = "driver_id"
    static let estimateDriverDistnace = "estimate_driver_distnace"
    static let accuracy = "accuracy"
    static let markertype = "marker_type"
  }

  // MARK: Properties
  public var bookingId: String?
  public var bookingStatus: String?
  public var estimateDriverTime: String?
  public var stillLongitude: String?
  public var stillLatitude: String?
  public var movableLongitude: String?
  public var movableLatitude: String?
  public var polyPoints: String?
  public var bearing: String?
  public var driverId: String?
  public var estimateDriverDistnace: String?
  public var accuracy: String?
    public var markertype: String?

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
    bookingStatus <- map[SerializationKeys.bookingStatus]
    estimateDriverTime <- map[SerializationKeys.estimateDriverTime]
    stillLongitude <- map[SerializationKeys.stillLongitude]
    stillLatitude <- map[SerializationKeys.stillLatitude]
    movableLongitude <- map[SerializationKeys.movableLongitude]
    movableLatitude <- map[SerializationKeys.movableLatitude]
    polyPoints <- map[SerializationKeys.polyPoints]
    bearing <- map[SerializationKeys.bearing]
    driverId <- map[SerializationKeys.driverId]
    estimateDriverDistnace <- map[SerializationKeys.estimateDriverDistnace]
    accuracy <- map[SerializationKeys.accuracy]
    markertype <- map[SerializationKeys.markertype]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = bookingId { dictionary[SerializationKeys.bookingId] = value }
    if let value = bookingStatus { dictionary[SerializationKeys.bookingStatus] = value }
    if let value = estimateDriverTime { dictionary[SerializationKeys.estimateDriverTime] = value }
    if let value = stillLongitude { dictionary[SerializationKeys.stillLongitude] = value }
    if let value = stillLatitude { dictionary[SerializationKeys.stillLatitude] = value }
    if let value = movableLongitude { dictionary[SerializationKeys.movableLongitude] = value }
    if let value = movableLatitude { dictionary[SerializationKeys.movableLatitude] = value }
    if let value = polyPoints { dictionary[SerializationKeys.polyPoints] = value }
    if let value = bearing { dictionary[SerializationKeys.bearing] = value }
    if let value = driverId { dictionary[SerializationKeys.driverId] = value }
    if let value = estimateDriverDistnace { dictionary[SerializationKeys.estimateDriverDistnace] = value }
    if let value = accuracy { dictionary[SerializationKeys.accuracy] = value }
    if let value = markertype { dictionary[SerializationKeys.markertype] = value }
    return dictionary
  }

}
