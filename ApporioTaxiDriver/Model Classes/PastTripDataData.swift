//
//  Data.swift
//
//  Created by apple on 2/7/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct PastTripDataData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let bookingId = "booking_id"
    static let smallLeftTextColor = "small_left_text_color"
    static let userNameText = "user_name_text"
    static let dropLocation = "drop_location"
    static let highlightedLeftText = "highlighted_left_text"
    static let smallLeftTextStyle = "small_left_text_style"
    static let statusText = "status_text"
    static let highlightedLeftTextStyle = "highlighted_left_text_style"
    static let smallRightText = "small_right_text"
    static let highlightedRightTextStyle = "highlighted_right_text_style"
    static let userDescriptionLayoutVisibility = "user_description_layout_visibility"
    static let highlightedRightText = "highlighted_right_text"
    static let circularImage = "circular_image"
    static let pickLocationVisibility = "pick_location_visibility"
    static let pickLocation = "pick_location"
    static let highlightedRightTextColor = "highlighted_right_text_color"
    static let statusTextColor = "status_text_color"
    static let smallLeftText = "small_left_text"
    static let smallRightTextColor = "small_right_text_color"
    static let highlightedLeftTextColor = "highlighted_left_text_color"
    static let userDescriptiveText = "user_descriptive_text"
    static let smallRightTextStyle = "small_right_text_style"
    static let dropLocationVisibility = "drop_location_visibility"
    static let statusTextSyle = "status_text_syle"
  }

  // MARK: Properties
  public var bookingId: Int?
  public var smallLeftTextColor: String?
  public var userNameText: String?
  public var dropLocation: String?
  public var highlightedLeftText: String?
  public var smallLeftTextStyle: String?
  public var statusText: String?
  public var highlightedLeftTextStyle: String?
  public var smallRightText: String?
  public var highlightedRightTextStyle: String?
  public var userDescriptionLayoutVisibility: Bool? = false
  public var highlightedRightText: String?
  public var circularImage: String?
  public var pickLocationVisibility: Bool? = false
  public var pickLocation: String?
  public var highlightedRightTextColor: String?
  public var statusTextColor: String?
  public var smallLeftText: String?
  public var smallRightTextColor: String?
  public var highlightedLeftTextColor: String?
  public var userDescriptiveText: String?
  public var smallRightTextStyle: String?
  public var dropLocationVisibility: Bool? = false
  public var statusTextSyle: String?

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
    smallLeftTextColor <- map[SerializationKeys.smallLeftTextColor]
    userNameText <- map[SerializationKeys.userNameText]
    dropLocation <- map[SerializationKeys.dropLocation]
    highlightedLeftText <- map[SerializationKeys.highlightedLeftText]
    smallLeftTextStyle <- map[SerializationKeys.smallLeftTextStyle]
    statusText <- map[SerializationKeys.statusText]
    highlightedLeftTextStyle <- map[SerializationKeys.highlightedLeftTextStyle]
    smallRightText <- map[SerializationKeys.smallRightText]
    highlightedRightTextStyle <- map[SerializationKeys.highlightedRightTextStyle]
    userDescriptionLayoutVisibility <- map[SerializationKeys.userDescriptionLayoutVisibility]
    highlightedRightText <- map[SerializationKeys.highlightedRightText]
    circularImage <- map[SerializationKeys.circularImage]
    pickLocationVisibility <- map[SerializationKeys.pickLocationVisibility]
    pickLocation <- map[SerializationKeys.pickLocation]
    highlightedRightTextColor <- map[SerializationKeys.highlightedRightTextColor]
    statusTextColor <- map[SerializationKeys.statusTextColor]
    smallLeftText <- map[SerializationKeys.smallLeftText]
    smallRightTextColor <- map[SerializationKeys.smallRightTextColor]
    highlightedLeftTextColor <- map[SerializationKeys.highlightedLeftTextColor]
    userDescriptiveText <- map[SerializationKeys.userDescriptiveText]
    smallRightTextStyle <- map[SerializationKeys.smallRightTextStyle]
    dropLocationVisibility <- map[SerializationKeys.dropLocationVisibility]
    statusTextSyle <- map[SerializationKeys.statusTextSyle]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = bookingId { dictionary[SerializationKeys.bookingId] = value }
    if let value = smallLeftTextColor { dictionary[SerializationKeys.smallLeftTextColor] = value }
    if let value = userNameText { dictionary[SerializationKeys.userNameText] = value }
    if let value = dropLocation { dictionary[SerializationKeys.dropLocation] = value }
    if let value = highlightedLeftText { dictionary[SerializationKeys.highlightedLeftText] = value }
    if let value = smallLeftTextStyle { dictionary[SerializationKeys.smallLeftTextStyle] = value }
    if let value = statusText { dictionary[SerializationKeys.statusText] = value }
    if let value = highlightedLeftTextStyle { dictionary[SerializationKeys.highlightedLeftTextStyle] = value }
    if let value = smallRightText { dictionary[SerializationKeys.smallRightText] = value }
    if let value = highlightedRightTextStyle { dictionary[SerializationKeys.highlightedRightTextStyle] = value }
    dictionary[SerializationKeys.userDescriptionLayoutVisibility] = userDescriptionLayoutVisibility
    if let value = highlightedRightText { dictionary[SerializationKeys.highlightedRightText] = value }
    if let value = circularImage { dictionary[SerializationKeys.circularImage] = value }
    dictionary[SerializationKeys.pickLocationVisibility] = pickLocationVisibility
    if let value = pickLocation { dictionary[SerializationKeys.pickLocation] = value }
    if let value = highlightedRightTextColor { dictionary[SerializationKeys.highlightedRightTextColor] = value }
    if let value = statusTextColor { dictionary[SerializationKeys.statusTextColor] = value }
    if let value = smallLeftText { dictionary[SerializationKeys.smallLeftText] = value }
    if let value = smallRightTextColor { dictionary[SerializationKeys.smallRightTextColor] = value }
    if let value = highlightedLeftTextColor { dictionary[SerializationKeys.highlightedLeftTextColor] = value }
    if let value = userDescriptiveText { dictionary[SerializationKeys.userDescriptiveText] = value }
    if let value = smallRightTextStyle { dictionary[SerializationKeys.smallRightTextStyle] = value }
    dictionary[SerializationKeys.dropLocationVisibility] = dropLocationVisibility
    if let value = statusTextSyle { dictionary[SerializationKeys.statusTextSyle] = value }
    return dictionary
  }

}
