//
//  AppMaintainance.swift
//
//  Created by apple on 2/21/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverAppConfigureAppMaintainance: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let showDialog = "show_dialog"
    static let showMessage = "show_message"
  }

  // MARK: Properties
  public var showDialog: Bool? = false
  public var showMessage: String?

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
    showDialog <- map[SerializationKeys.showDialog]
    showMessage <- map[SerializationKeys.showMessage]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.showDialog] = showDialog
    if let value = showMessage { dictionary[SerializationKeys.showMessage] = value }
    return dictionary
  }

}
