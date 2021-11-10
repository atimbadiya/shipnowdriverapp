//
//  AppVersionDialog.swift
//
//  Created by apple on 2/21/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverAppConfigureAppVersionDialog: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let showDialog = "show_dialog"
    static let mandatory = "mandatory"
    static let dialogMessage = "dialog_message"
    static let iosdriverappid = "ios_driver_appid"
  }

  // MARK: Properties
  public var showDialog: Bool? = false
  public var mandatory: Bool? = false
  public var dialogMessage: String?
public var iosdriverappid: String?
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
    mandatory <- map[SerializationKeys.mandatory]
    dialogMessage <- map[SerializationKeys.dialogMessage]
     iosdriverappid <- map[SerializationKeys.iosdriverappid]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.showDialog] = showDialog
    dictionary[SerializationKeys.mandatory] = mandatory
    if let value = dialogMessage { dictionary[SerializationKeys.dialogMessage] = value }
    if let value = iosdriverappid { dictionary[SerializationKeys.iosdriverappid] = value }
    return dictionary
  }

}
