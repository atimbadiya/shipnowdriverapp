//
//  GeneralConfig.swift
//
//  Created by apple on 2/21/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverAppConfigureGeneralConfig: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let chat = "chat"
    static let manualDispatch = "manual_dispatch"
    static let defaultLanguage = "default_language"
    static let demo = "demo"
    static let driverWalletPackage = "driver_wallet_package"
    static let enableSuperDriver = "enable_super_driver"
    static let vehicleOwner = "vehicle_owner"
    static let vehicleEnable = "vehicle_ac_enable"
    static let driverLimit = "driver_limit"
    static let autoAcceptRide = "auto_accept_mode"
    static let subscriptionPackage = "subscription_package"
    static let bankDetails = "bank_details_enable"
    static let homeAddress = "home_address_enable"
    static let existingVehicleEnable = "existing_vehicle_enable"
    static let emergencyContact = "emergency_contact"
    static let babySeatEnable = "baby_seat_enable"
    static let addmutiplevehicle = "add_multiple_vehicle"
    static let wheelchairenable = "wheel_chair_enable"
    static let onlineTransactionCode = "online_transaction_code"
    static let splashscreendriver = "splash_screen_driver"
    static let otpFromFirebase = "otp_from_firebase"
    static let demandspotenable = "demand_spot_enable"
    static let drivercpfnumberenable = "driver_cpf_number_enable"
    static let servicetypeselection = "service_type_selection"
    static let vehiclemaketext = "vehicle_make_text"
    static let vehiclemodeltext = "vehicle_model_text"
    static let polyline = "polyline"
    static let bookingeta = "booking_eta"
    static let referralcodemandatory = "referral_code_mandatory_driver_signup"
    static let pushnotification = "push_notification"
    
  }

  // MARK: Properties
  public var chat: Bool? = false
  public var manualDispatch: Bool? = false
  public var defaultLanguage: String?
  public var demo: Bool? = false
  public var driverWalletPackage: [DriverAppConfigureDriverWalletPackage]?
  public var enableSuperDriver: Bool? = false
  public var vehicleOwner: Bool? = false
  public var vehicleEnable: Bool? = false
  public var driverLimit: Bool? = false
  public var autoAcceptRide: Bool? = false
  public var subscriptionPackage: Bool? = false
  public var bankDetails: Bool? = false
  public var homeAddress: Bool? = false
  public var existingVehicleEnable: Bool? = false
    public var emergencyContact: Bool? = false
    public var babySeatEnable: Bool? = false
     public var addmutiplevehicle: Bool? = false
    public var wheelchairenable: Bool? = false
    public var otpFromFirebase: Bool? = false
 public var onlineTransactionCode: OnlineTransactionCode?
    public var splashscreendriver: String?
    public var demandspotenable: Bool? = false
    public var drivercpfnumberenable: Bool? = false
    public var servicetypeselection: Bool? = false
    public var vehiclemaketext: Bool? = false
    public var vehiclemodeltext: Bool? = false
    public var polyline: Bool? = false
    public var bookingeta: Bool? = false
    public var referralcodemandatory: Bool? = false
    public var pushnotification: Int?
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
    chat <- map[SerializationKeys.chat]
    manualDispatch <- map[SerializationKeys.manualDispatch]
    defaultLanguage <- map[SerializationKeys.defaultLanguage]
    demo <- map[SerializationKeys.demo]
    driverWalletPackage <- map[SerializationKeys.driverWalletPackage]
    enableSuperDriver <- map[SerializationKeys.enableSuperDriver]
    vehicleOwner <- map[SerializationKeys.vehicleOwner]
    vehicleEnable <- map[SerializationKeys.vehicleEnable]
    driverLimit <- map[SerializationKeys.driverLimit]
    autoAcceptRide <- map[SerializationKeys.autoAcceptRide]
    subscriptionPackage <- map[SerializationKeys.subscriptionPackage]
    bankDetails <- map[SerializationKeys.bankDetails]
    homeAddress <- map[SerializationKeys.homeAddress]
    existingVehicleEnable <- map[SerializationKeys.existingVehicleEnable]
    emergencyContact <- map[SerializationKeys.emergencyContact]
    babySeatEnable <- map[SerializationKeys.babySeatEnable]
    addmutiplevehicle <- map[SerializationKeys.addmutiplevehicle]
    wheelchairenable <- map[SerializationKeys.wheelchairenable]
    otpFromFirebase <- map[SerializationKeys.otpFromFirebase]
    
    onlineTransactionCode <- map[SerializationKeys.onlineTransactionCode]
    splashscreendriver <- map[SerializationKeys.splashscreendriver]
     demandspotenable <- map[SerializationKeys.demandspotenable]
    drivercpfnumberenable <- map[SerializationKeys.drivercpfnumberenable]
    servicetypeselection <- map[SerializationKeys.servicetypeselection]
    vehiclemaketext <- map[SerializationKeys.vehiclemaketext]
    vehiclemodeltext <- map[SerializationKeys.vehiclemodeltext]
    polyline <- map[SerializationKeys.polyline]
    bookingeta <- map[SerializationKeys.bookingeta]
    referralcodemandatory <- map[SerializationKeys.referralcodemandatory]
    pushnotification <- map[SerializationKeys.pushnotification]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.chat] = chat
    dictionary[SerializationKeys.manualDispatch] = manualDispatch
    if let value = defaultLanguage { dictionary[SerializationKeys.defaultLanguage] = value }
    dictionary[SerializationKeys.demo] = demo
    if let value = driverWalletPackage { dictionary[SerializationKeys.driverWalletPackage] = value.map { $0.dictionaryRepresentation() } }
    dictionary[SerializationKeys.enableSuperDriver] = enableSuperDriver
    dictionary[SerializationKeys.vehicleOwner] = vehicleOwner
    dictionary[SerializationKeys.vehicleEnable] = vehicleEnable
    dictionary[SerializationKeys.driverLimit] = driverLimit
    dictionary[SerializationKeys.autoAcceptRide] = autoAcceptRide
    dictionary[SerializationKeys.subscriptionPackage] = subscriptionPackage
    dictionary[SerializationKeys.bankDetails] = bankDetails
    dictionary[SerializationKeys.homeAddress] = homeAddress
    dictionary[SerializationKeys.existingVehicleEnable] = existingVehicleEnable
    dictionary[SerializationKeys.emergencyContact] = emergencyContact

    dictionary[SerializationKeys.babySeatEnable] = babySeatEnable

    dictionary[SerializationKeys.addmutiplevehicle] = addmutiplevehicle
     dictionary[SerializationKeys.wheelchairenable] = wheelchairenable
    dictionary[SerializationKeys.otpFromFirebase] = otpFromFirebase
     if let value = onlineTransactionCode { dictionary[SerializationKeys.onlineTransactionCode] = value.dictionaryRepresentation() }
    if let value = splashscreendriver { dictionary[SerializationKeys.splashscreendriver] = value }
    dictionary[SerializationKeys.demandspotenable] = demandspotenable
    dictionary[SerializationKeys.drivercpfnumberenable] = drivercpfnumberenable
    dictionary[SerializationKeys.servicetypeselection] = servicetypeselection
    dictionary[SerializationKeys.vehiclemaketext] = vehiclemaketext
    dictionary[SerializationKeys.vehiclemodeltext] = vehiclemodeltext
    dictionary[SerializationKeys.polyline] = polyline
    dictionary[SerializationKeys.bookingeta] = bookingeta
     dictionary[SerializationKeys.referralcodemandatory] = referralcodemandatory
    if let value = pushnotification { dictionary[SerializationKeys.pushnotification] = value }
    return dictionary
  }

}
