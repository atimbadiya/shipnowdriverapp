//
//  HolderRideInfo.swift
//
//  Created by apple on 2/13/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverRecieptHolderRideInfo: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let circularTextColor = "circular_text_color"
    static let leftTextColor = "left_text_color"
    static let dropLocationVisibility = "drop_location_visibility"
    static let dropLocation = "drop_location"
    static let leftTextStyle = "left_text_style"
    static let pickLocaion = "pick_locaion"
    static let circularText = "circular_text"
    static let circularImageVisibility = "circular_image_visibility"
    static let leftText = "left_text"
    static let circularTextOne = "circular_text_one"
    static let circularImage = "circular_image"
    static let leftTextVisibility = "left_text_visibility"
    static let pickLocationVisibility = "pick_location_visibility"
    static let valueTextStyle = "value_text_style"
    static let rightTextStyle = "right_text_style"
    static let rightTextVisibility = "right_text_visibility"
    static let circularTextStyle = "circular_text_style"
    static let rightText = "right_text"
    static let valueTextVisibility = "value_text_visibility"
    static let circularTextVisibility = "circular_text_visibility"
    static let staticValues = "static_values"
    static let valueTextColor = "value_text_color"
    static let rightTextColor = "right_text_color"
    static let valueText = "value_text"
  }

  // MARK: Properties
  public var circularTextColor: String?
  public var leftTextColor: String?
  public var dropLocationVisibility: Bool? = false
  public var dropLocation: String?
  public var leftTextStyle: String?
  public var pickLocaion: String?
  public var circularText: String?
  public var circularImageVisibility: Bool? = false
  public var leftText: String?
  public var circularTextOne: String?
  public var circularImage: String?
  public var leftTextVisibility: Bool? = false
  public var pickLocationVisibility: Bool? = false
  public var valueTextStyle: String?
  public var rightTextStyle: String?
  public var rightTextVisibility: Bool? = false
  public var circularTextStyle: String?
  public var rightText: String?
  public var valueTextVisibility: Bool? = false
  public var circularTextVisibility: Bool? = false
  public var staticValues: [DriverRecieptStaticValues]?
  public var valueTextColor: String?
  public var rightTextColor: String?
  public var valueText: String?

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
    circularTextColor <- map[SerializationKeys.circularTextColor]
    leftTextColor <- map[SerializationKeys.leftTextColor]
    dropLocationVisibility <- map[SerializationKeys.dropLocationVisibility]
    dropLocation <- map[SerializationKeys.dropLocation]
    leftTextStyle <- map[SerializationKeys.leftTextStyle]
    pickLocaion <- map[SerializationKeys.pickLocaion]
    circularText <- map[SerializationKeys.circularText]
    circularImageVisibility <- map[SerializationKeys.circularImageVisibility]
    leftText <- map[SerializationKeys.leftText]
    circularTextOne <- map[SerializationKeys.circularTextOne]
    circularImage <- map[SerializationKeys.circularImage]
    leftTextVisibility <- map[SerializationKeys.leftTextVisibility]
    pickLocationVisibility <- map[SerializationKeys.pickLocationVisibility]
    valueTextStyle <- map[SerializationKeys.valueTextStyle]
    rightTextStyle <- map[SerializationKeys.rightTextStyle]
    rightTextVisibility <- map[SerializationKeys.rightTextVisibility]
    circularTextStyle <- map[SerializationKeys.circularTextStyle]
    rightText <- map[SerializationKeys.rightText]
    valueTextVisibility <- map[SerializationKeys.valueTextVisibility]
    circularTextVisibility <- map[SerializationKeys.circularTextVisibility]
    staticValues <- map[SerializationKeys.staticValues]
    valueTextColor <- map[SerializationKeys.valueTextColor]
    rightTextColor <- map[SerializationKeys.rightTextColor]
    valueText <- map[SerializationKeys.valueText]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = circularTextColor { dictionary[SerializationKeys.circularTextColor] = value }
    if let value = leftTextColor { dictionary[SerializationKeys.leftTextColor] = value }
    dictionary[SerializationKeys.dropLocationVisibility] = dropLocationVisibility
    if let value = dropLocation { dictionary[SerializationKeys.dropLocation] = value }
    if let value = leftTextStyle { dictionary[SerializationKeys.leftTextStyle] = value }
    if let value = pickLocaion { dictionary[SerializationKeys.pickLocaion] = value }
    if let value = circularText { dictionary[SerializationKeys.circularText] = value }
    dictionary[SerializationKeys.circularImageVisibility] = circularImageVisibility
    if let value = leftText { dictionary[SerializationKeys.leftText] = value }
    if let value = circularTextOne { dictionary[SerializationKeys.circularTextOne] = value }
    if let value = circularImage { dictionary[SerializationKeys.circularImage] = value }
    dictionary[SerializationKeys.leftTextVisibility] = leftTextVisibility
    dictionary[SerializationKeys.pickLocationVisibility] = pickLocationVisibility
    if let value = valueTextStyle { dictionary[SerializationKeys.valueTextStyle] = value }
    if let value = rightTextStyle { dictionary[SerializationKeys.rightTextStyle] = value }
    dictionary[SerializationKeys.rightTextVisibility] = rightTextVisibility
    if let value = circularTextStyle { dictionary[SerializationKeys.circularTextStyle] = value }
    if let value = rightText { dictionary[SerializationKeys.rightText] = value }
    dictionary[SerializationKeys.valueTextVisibility] = valueTextVisibility
    dictionary[SerializationKeys.circularTextVisibility] = circularTextVisibility
    if let value = staticValues { dictionary[SerializationKeys.staticValues] = value.map { $0.dictionaryRepresentation() } }
    if let value = valueTextColor { dictionary[SerializationKeys.valueTextColor] = value }
    if let value = rightTextColor { dictionary[SerializationKeys.rightTextColor] = value }
    if let value = valueText { dictionary[SerializationKeys.valueText] = value }
    return dictionary
  }

}
