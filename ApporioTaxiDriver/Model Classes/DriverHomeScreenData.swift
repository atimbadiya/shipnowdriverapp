//
//  Data.swift
//
//  Created by apple on 2/5/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverHomeScreenData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let homeAddressActivated = "home_address_activated"
    static let activeRides = "active_rides"
    static let scheduledRides = "scheduled_rides"
    static let todays = "todays"
    static let activeVehicle = "active_vehicle"
    static let rideConfig = "ride_config"
    static let adminMessage = "admin_message"
    static let currency = "currency"
    static let termStatus = "term_status"
    static let adminMessages = "admin_message"
    static let availableservices = "available_services"
    static let driverData = "driver_data"
    static let walletMoney = "wallet_money"
    static let geofenceQueueEnable = "geofence_queue_enable"
    static let geofenceQueueActive = "geofence_queue_active"
    static let geofencequeuetext = "geofence_queue_text"
    static let geofencequeuecolor = "geofence_queue_color"
  }

  // MARK: Properties
  public var homeAddressActivated: String?
  public var activeRides: [DriverHomeScreenActiveRides]?
  public var scheduledRides: [Any]?
  public var todays: DriverHomeTodays?
  public var activeVehicle: DriverHomeActiveVehicle?
  public var rideConfig: DriverHomeRideConfig?
  public var adminMessage: [Any]?
  public var currency: String?
  public var termStatus: Int?
  public var adminMessages: [MainScreenAdminMessageModel]?
    public var availableservices: [AvailableServices]?
    public var driverData: MainScreenDriverData?
    public var walletMoney: String?
    public var geofenceQueueEnable: Bool? = false
    public var geofenceQueueActive: Bool? = false
    public var geofencequeuetext: String?
    public var geofencequeuecolor: String?

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
    homeAddressActivated <- map[SerializationKeys.homeAddressActivated]
    activeRides <- map[SerializationKeys.activeRides]
    scheduledRides <- map[SerializationKeys.scheduledRides]
    todays <- map[SerializationKeys.todays]
    activeVehicle <- map[SerializationKeys.activeVehicle]
    rideConfig <- map[SerializationKeys.rideConfig]
    adminMessage <- map[SerializationKeys.adminMessage]
    currency <- map[SerializationKeys.currency]
    termStatus <- map[SerializationKeys.termStatus]
    adminMessages <- map[SerializationKeys.adminMessages]
    availableservices <- map[SerializationKeys.availableservices]
    driverData <- map[SerializationKeys.driverData]
    walletMoney <- map[SerializationKeys.walletMoney]
    geofenceQueueEnable <- map[SerializationKeys.geofenceQueueEnable]
    geofenceQueueActive <- map[SerializationKeys.geofenceQueueActive]
    geofencequeuetext <- map[SerializationKeys.geofencequeuetext]
    geofencequeuecolor <- map[SerializationKeys.geofencequeuecolor]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = homeAddressActivated { dictionary[SerializationKeys.homeAddressActivated] = value }
    if let value = activeRides { dictionary[SerializationKeys.activeRides] = value.map { $0.dictionaryRepresentation() } }
    if let value = scheduledRides { dictionary[SerializationKeys.scheduledRides] = value }
    if let value = todays { dictionary[SerializationKeys.todays] = value.dictionaryRepresentation() }
    if let value = activeVehicle { dictionary[SerializationKeys.activeVehicle] = value.dictionaryRepresentation() }
    if let value = rideConfig { dictionary[SerializationKeys.rideConfig] = value.dictionaryRepresentation() }
    if let value = adminMessage { dictionary[SerializationKeys.adminMessage] = value }
    if let value = currency { dictionary[SerializationKeys.currency] = value }
    if let value = termStatus { dictionary[SerializationKeys.termStatus] = value }
    if let value = adminMessages { dictionary[SerializationKeys.adminMessages] = value.map { $0.dictionaryRepresentation() } }
     if let value = availableservices { dictionary[SerializationKeys.availableservices] = value.map { $0.dictionaryRepresentation() } }
    if let value = driverData { dictionary[SerializationKeys.driverData] = value.dictionaryRepresentation() }
    if let value = walletMoney { dictionary[SerializationKeys.walletMoney] = value }
    dictionary[SerializationKeys.geofenceQueueEnable] = geofenceQueueEnable
    dictionary[SerializationKeys.geofenceQueueActive] = geofenceQueueActive
    if let value = geofencequeuetext { dictionary[SerializationKeys.geofencequeuetext] = value }
    if let value = geofencequeuecolor { dictionary[SerializationKeys.geofencequeuecolor] = value }
    return dictionary
  }

}
