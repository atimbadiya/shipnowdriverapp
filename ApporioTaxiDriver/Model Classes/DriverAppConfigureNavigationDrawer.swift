//
//  NavigationDrawer.swift
//
//  Created by apple on 2/21/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverAppConfigureNavigationDrawer: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let language = "language"
    static let reportIssue = "report_issue"
    static let wallet = "wallet"
    static let cmsPage = "cms_page"
    static let customerSupport = "customer_support"
  }

  // MARK: Properties
  public var language: Bool? = false
  public var reportIssue: Bool? = false
  public var wallet: Bool? = false
  public var cmsPage: Bool? = false
  public var customerSupport: Bool? = false

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
    language <- map[SerializationKeys.language]
    reportIssue <- map[SerializationKeys.reportIssue]
    wallet <- map[SerializationKeys.wallet]
    cmsPage <- map[SerializationKeys.cmsPage]
    customerSupport <- map[SerializationKeys.customerSupport]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.language] = language
    dictionary[SerializationKeys.reportIssue] = reportIssue
    dictionary[SerializationKeys.wallet] = wallet
    dictionary[SerializationKeys.cmsPage] = cmsPage
    dictionary[SerializationKeys.customerSupport] = customerSupport
    return dictionary
  }

}
