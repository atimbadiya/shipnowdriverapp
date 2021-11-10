//
//  Data.swift
//
//  Created by apple on 2/21/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverAppConfigureData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let register = "register"
    static let countries = "countries"
    static let paymentOption = "paymentOption"
    static let appVersionDialog = "app_version_dialog"
    static let tracking = "tracking"
    static let customerSupport = "customer_support"
    static let receiving = "receiving"
    static let languages = "languages"
    static let appMaintainance = "app_maintainance"
    static let rideConfig = "ride_config"
    static let navigationDrawer = "navigation_drawer"
    static let generalConfig = "general_config"
    static let login = "login"
    static let themeConfig = "theme_cofig"
    static let driverCommissionChoices = "driver_commission_choices"
    static let addwalletmoneyenable = "add_wallet_money_enable"
    static let segments = "segments"
  }

  // MARK: Properties
  public var register: DriverAppConfigureRegister?
  public var countries: [DriverAppConfigureCountries]?
  public var paymentOption: [DriverAppConfigurePaymentOption]?
  public var appVersionDialog: DriverAppConfigureAppVersionDialog?
  public var tracking: DriverAppConfigureTracking?
  public var customerSupport: DriverAppConfigureCustomerSupport?
  public var receiving: DriverAppConfigureReceiving?
  public var languages: [DriverAppConfigureLanguages]?
  public var appMaintainance: DriverAppConfigureAppMaintainance?
  public var rideConfig: DriverAppConfigureRideConfig?
  public var navigationDrawer: DriverAppConfigureNavigationDrawer?
  public var generalConfig: DriverAppConfigureGeneralConfig?
  public var login: DriverAppConfigureLogin?
  public var themeConfig: ThemeConfiguration?
    public var driverCommissionChoices: [DriverCommissionChoices]?
    public var addwalletmoneyenable: Bool? = false
    public var segments: [Segments]?

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
    register <- map[SerializationKeys.register]
    countries <- map[SerializationKeys.countries]
    paymentOption <- map[SerializationKeys.paymentOption]
    appVersionDialog <- map[SerializationKeys.appVersionDialog]
    tracking <- map[SerializationKeys.tracking]
    customerSupport <- map[SerializationKeys.customerSupport]
    receiving <- map[SerializationKeys.receiving]
    languages <- map[SerializationKeys.languages]
    appMaintainance <- map[SerializationKeys.appMaintainance]
    rideConfig <- map[SerializationKeys.rideConfig]
    navigationDrawer <- map[SerializationKeys.navigationDrawer]
    generalConfig <- map[SerializationKeys.generalConfig]
    login <- map[SerializationKeys.login]
    themeConfig <- map[SerializationKeys.themeConfig]
    driverCommissionChoices <- map[SerializationKeys.driverCommissionChoices]
    addwalletmoneyenable <- map[SerializationKeys.addwalletmoneyenable]
    segments <- map[SerializationKeys.segments]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = register { dictionary[SerializationKeys.register] = value.dictionaryRepresentation() }
    if let value = countries { dictionary[SerializationKeys.countries] = value.map { $0.dictionaryRepresentation() } }
    if let value = paymentOption { dictionary[SerializationKeys.paymentOption] = value.map { $0.dictionaryRepresentation() } }
    if let value = appVersionDialog { dictionary[SerializationKeys.appVersionDialog] = value.dictionaryRepresentation() }
    if let value = tracking { dictionary[SerializationKeys.tracking] = value.dictionaryRepresentation() }
    if let value = customerSupport { dictionary[SerializationKeys.customerSupport] = value.dictionaryRepresentation() }
    if let value = receiving { dictionary[SerializationKeys.receiving] = value.dictionaryRepresentation() }
    if let value = languages { dictionary[SerializationKeys.languages] = value.map { $0.dictionaryRepresentation() } }
    if let value = appMaintainance { dictionary[SerializationKeys.appMaintainance] = value.dictionaryRepresentation() }
    if let value = rideConfig { dictionary[SerializationKeys.rideConfig] = value.dictionaryRepresentation() }
    if let value = navigationDrawer { dictionary[SerializationKeys.navigationDrawer] = value.dictionaryRepresentation() }
    if let value = generalConfig { dictionary[SerializationKeys.generalConfig] = value.dictionaryRepresentation() }
     if let value = login { dictionary[SerializationKeys.login] = value.dictionaryRepresentation() }
    if let value = themeConfig { dictionary[SerializationKeys.themeConfig] = value.dictionaryRepresentation() }
    if let value = driverCommissionChoices { dictionary[SerializationKeys.driverCommissionChoices] = value.map { $0.dictionaryRepresentation() } }
    dictionary[SerializationKeys.addwalletmoneyenable] = addwalletmoneyenable
    if let value = segments { dictionary[SerializationKeys.segments] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
