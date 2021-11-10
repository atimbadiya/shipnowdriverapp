//
//  Data.swift
//
//  Created by Atul Jain on 28/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct ReferEarnData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let referCode = "refer_code"
    static let referHeading = "refer_heading"
    static let sharingText = "sharing_text"
    static let referStatus = "refer_status"
    static let referExplanation = "refer_explanation"
    static let referImage = "refer_image"
    static let endDate = "end_date"
    static let startDate = "start_date"
    static let referOffer = "refer_offer"
  }

  // MARK: Properties
  public var referCode: String?
  public var referHeading: String?
  public var sharingText: String?
  public var referStatus: String?
  public var referExplanation: String?
  public var referImage: String?
  public var endDate: String?
  public var startDate: String?
  public var referOffer: String?

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
    referCode <- map[SerializationKeys.referCode]
    referHeading <- map[SerializationKeys.referHeading]
    sharingText <- map[SerializationKeys.sharingText]
    referStatus <- map[SerializationKeys.referStatus]
    referExplanation <- map[SerializationKeys.referExplanation]
    referImage <- map[SerializationKeys.referImage]
    endDate <- map[SerializationKeys.endDate]
    startDate <- map[SerializationKeys.startDate]
    referOffer <- map[SerializationKeys.referOffer]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = referCode { dictionary[SerializationKeys.referCode] = value }
    if let value = referHeading { dictionary[SerializationKeys.referHeading] = value }
    if let value = sharingText { dictionary[SerializationKeys.sharingText] = value }
    if let value = referStatus { dictionary[SerializationKeys.referStatus] = value }
    if let value = referExplanation { dictionary[SerializationKeys.referExplanation] = value }
    if let value = referImage { dictionary[SerializationKeys.referImage] = value }
    if let value = endDate { dictionary[SerializationKeys.endDate] = value }
    if let value = startDate { dictionary[SerializationKeys.startDate] = value }
    if let value = referOffer { dictionary[SerializationKeys.referOffer] = value }
    return dictionary
  }

}
