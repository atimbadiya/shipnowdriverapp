//
//  Holderbookingdescriptiondata.swift
//
//  Created by Atul Jain on 20/02/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct RideDetailsHolderbookingdescriptiondata: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let smallLeftTextStyle = "small_left_text_style"
    static let smallLeftTextColor = "small_left_text_color"
    static let highlightedRightText = "highlighted_right_text"
    static let highlightedRightTextColor = "highlighted_right_text_color"
    static let highlightedLeftText = "highlighted_left_text"
    static let smallLeftText = "small_left_text"
    static let smallRightTextColor = "small_right_text_color"
    static let highlightedLeftTextColor = "highlighted_left_text_color"
    static let highlightedRightTextStyle = "highlighted_right_text_style"
    static let smallRightTextStyle = "small_right_text_style"
    static let smallRightText = "small_right_text"
    static let highlightedLeftTextStyle = "highlighted_left_text_style"
    static let smallrighttextcolor = "small_right_text_color"
    static let bookingstatustext = "booking_status_text"
    static let bookingstatus = "booking_status"
    static let additionalInfo = "additional_info"
    static let additionalInfoVisibility = "additional_info_visibility"
  }

  // MARK: Properties
    public var smallLeftTextStyle: String?
    public var smallLeftTextColor: String?
    public var highlightedRightText: String?
    public var highlightedRightTextColor: String?
    public var highlightedLeftText: String?
    public var smallLeftText: String?
    public var smallRightTextColor: String?
    public var highlightedLeftTextColor: String?
    public var highlightedRightTextStyle: String?
    public var smallRightTextStyle: String?
    public var smallRightText: String?
    public var highlightedLeftTextStyle: String?
    public var smallrighttextcolor: String?
    public var bookingstatustext: String?
    public var bookingstatus: String?
    public var additionalInfo: String?
    public var additionalInfoVisibility: Bool? = false

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
        smallLeftTextStyle <- map[SerializationKeys.smallLeftTextStyle]
        smallLeftTextColor <- map[SerializationKeys.smallLeftTextColor]
        highlightedRightText <- map[SerializationKeys.highlightedRightText]
        highlightedRightTextColor <- map[SerializationKeys.highlightedRightTextColor]
        highlightedLeftText <- map[SerializationKeys.highlightedLeftText]
        smallLeftText <- map[SerializationKeys.smallLeftText]
        smallRightTextColor <- map[SerializationKeys.smallRightTextColor]
        highlightedLeftTextColor <- map[SerializationKeys.highlightedLeftTextColor]
        highlightedRightTextStyle <- map[SerializationKeys.highlightedRightTextStyle]
        smallRightTextStyle <- map[SerializationKeys.smallRightTextStyle]
        smallRightText <- map[SerializationKeys.smallRightText]
        highlightedLeftTextStyle <- map[SerializationKeys.highlightedLeftTextStyle]
        smallrighttextcolor <- map[SerializationKeys.smallrighttextcolor]
        bookingstatustext <- map[SerializationKeys.bookingstatustext]
        bookingstatus <- map[SerializationKeys.bookingstatus]
        additionalInfo <- map[SerializationKeys.additionalInfo]
        additionalInfoVisibility <- map[SerializationKeys.additionalInfoVisibility]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
        if let value = smallLeftTextStyle { dictionary[SerializationKeys.smallLeftTextStyle] = value }
        if let value = smallLeftTextColor { dictionary[SerializationKeys.smallLeftTextColor] = value }
        if let value = highlightedRightText { dictionary[SerializationKeys.highlightedRightText] = value }
        if let value = highlightedRightTextColor { dictionary[SerializationKeys.highlightedRightTextColor] = value }
        if let value = highlightedLeftText { dictionary[SerializationKeys.highlightedLeftText] = value }
        if let value = smallLeftText { dictionary[SerializationKeys.smallLeftText] = value }
        if let value = smallRightTextColor { dictionary[SerializationKeys.smallRightTextColor] = value }
        if let value = highlightedLeftTextColor { dictionary[SerializationKeys.highlightedLeftTextColor] = value }
        if let value = highlightedRightTextStyle { dictionary[SerializationKeys.highlightedRightTextStyle] = value }
        if let value = smallRightTextStyle { dictionary[SerializationKeys.smallRightTextStyle] = value }
        if let value = smallRightText { dictionary[SerializationKeys.smallRightText] = value }
        if let value = highlightedLeftTextStyle { dictionary[SerializationKeys.highlightedLeftTextStyle] = value }
        if let value = smallrighttextcolor { dictionary[SerializationKeys.smallrighttextcolor] = value }
        if let value = bookingstatustext { dictionary[SerializationKeys.bookingstatustext] = value }
        if let value = bookingstatus { dictionary[SerializationKeys.bookingstatus] = value }
        if let value = additionalInfo { dictionary[SerializationKeys.additionalInfo] = value }
        if let value = additionalInfoVisibility { dictionary[SerializationKeys.additionalInfoVisibility] = value }

    return dictionary
  }

}
