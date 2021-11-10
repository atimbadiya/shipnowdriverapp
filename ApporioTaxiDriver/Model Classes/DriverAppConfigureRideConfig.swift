//
//  RideConfig.swift
//
//  Created by apple on 2/21/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverAppConfigureRideConfig: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let outstation = "outstation"
    static let locationUpdateTimeband = "location_update_timeband"
    static let trackingScreenRefreshTimeband = "tracking_screen_refresh_timeband"
    static let slidebutton = "slide_button"
    static let outstationnotificationpopup = "outstation_notification_popup"
  }

  // MARK: Properties
  public var outstation: Bool? = false
  public var locationUpdateTimeband: String?
  public var trackingScreenRefreshTimeband: String?
    public var slidebutton: Bool? = false
    public var outstationnotificationpopup: Bool? = false

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
    outstation <- map[SerializationKeys.outstation]
    locationUpdateTimeband <- map[SerializationKeys.locationUpdateTimeband]
    trackingScreenRefreshTimeband <- map[SerializationKeys.trackingScreenRefreshTimeband]
    slidebutton <- map[SerializationKeys.slidebutton]
    outstationnotificationpopup <- map[SerializationKeys.outstationnotificationpopup]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.outstation] = outstation
    if let value = locationUpdateTimeband { dictionary[SerializationKeys.locationUpdateTimeband] = value }
    if let value = trackingScreenRefreshTimeband { dictionary[SerializationKeys.trackingScreenRefreshTimeband] = value }
    dictionary[SerializationKeys.slidebutton] = outstation
    dictionary[SerializationKeys.outstationnotificationpopup] = outstationnotificationpopup
    return dictionary
  }

}
