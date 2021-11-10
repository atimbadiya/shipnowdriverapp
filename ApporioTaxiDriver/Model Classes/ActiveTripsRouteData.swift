//
//  ActiveTripsRouteData.swift
//  ApporioTaxiDriver
//
//  Created by Ship Now 2 on 22/9/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import Foundation
import ObjectMapper

public struct ActiveTripsRouteData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
      static let booking_id = "booking_id"
      static let tracking_id = "tracking_id"
      static let pickup_latitude = "pickup_latitude"
      static let pickup_longitude = "pickup_longitude"
      static let drop_latitude = "drop_latitude"
      static let drop_longitude = "drop_longitude"
      static let pickup_location = "pickup_location"
      static let drop_location = "drop_location"
      static let corporate_booking_status = "corporate_booking_status"
      static let booking_status = "booking_status"
      static let booking_date = "date"
      static let company_name = "company_name"
      static let company_contact_number = "company_contact_number"
      static let pickup_ready = "pickup_ready"
      static let dropoff_ready = "dropoff_ready"
  }


  // MARK: Properties
    public var booking_id: Int?
    public var tracking_id: String?
    public var pickup_latitude: String?
    public var pickup_longitude: String?
    public var drop_latitude: String?
    public var drop_longitude: String?
    public var pickup_location: String?
    public var drop_location: String?
    public var corporate_booking_status: Int?
    public var booking_status: Int?
    public var booking_date: String?
    public var company_name: String?
    public var company_contact_number: String?
    public var pickup_ready: String?
    public var dropoff_ready: String?


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
        booking_id <- map[SerializationKeys.booking_id]
        tracking_id <- map[SerializationKeys.tracking_id]
        pickup_latitude <- map[SerializationKeys.pickup_latitude]
        pickup_longitude <- map[SerializationKeys.pickup_longitude]
        drop_latitude <- map[SerializationKeys.drop_latitude]
        drop_longitude <- map[SerializationKeys.drop_longitude]
        pickup_location <- map[SerializationKeys.pickup_location]
        drop_location <- map[SerializationKeys.drop_location]
        corporate_booking_status <- map[SerializationKeys.corporate_booking_status]
        booking_status <- map[SerializationKeys.booking_status]
        booking_date <- map[SerializationKeys.booking_date]
        company_name <- map[SerializationKeys.company_name]
        company_contact_number <- map[SerializationKeys.company_contact_number]
        pickup_ready <- map[SerializationKeys.pickup_ready]
        dropoff_ready <- map[SerializationKeys.dropoff_ready]

  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = booking_id { dictionary[SerializationKeys.booking_id] = value }
      if let value = tracking_id { dictionary[SerializationKeys.tracking_id] = value }
      if let value = pickup_latitude { dictionary[SerializationKeys.pickup_latitude] = value }
      if let value = pickup_longitude { dictionary[SerializationKeys.pickup_longitude] = value }
      if let value = drop_latitude { dictionary[SerializationKeys.drop_latitude] = value }
      if let value = drop_longitude { dictionary[SerializationKeys.drop_longitude] = value }
      if let value = pickup_location { dictionary[SerializationKeys.pickup_location] = value }
      if let value = drop_location { dictionary[SerializationKeys.drop_location] = value }
      if let value = corporate_booking_status { dictionary[SerializationKeys.corporate_booking_status] = value }
      if let value = booking_status { dictionary[SerializationKeys.booking_status] = value }
      if let value = booking_date { dictionary[SerializationKeys.booking_date] = value }
      if let value = company_name { dictionary[SerializationKeys.company_name] = value }
      if let value = company_contact_number { dictionary[SerializationKeys.company_contact_number] = value }
      if let value = pickup_ready { dictionary[SerializationKeys.pickup_ready] = value }
      if let value = dropoff_ready { dictionary[SerializationKeys.dropoff_ready] = value }

    return dictionary
  }
}
