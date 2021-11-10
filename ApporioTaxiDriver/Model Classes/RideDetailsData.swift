//
//  Data.swift
//
//  Created by Atul Jain on 20/02/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct RideDetailsData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let holderReceipt = "holder_receipt"
    static let holderPickdropLocation = "holder_pickdrop_location"
    static let holderMapImage = "holder_map_image"
    static let holderUser = "holder_user"
    static let holderMetering = "holder_metering"
    static let holderBookingDescription = "holder_booking_description"
    static let buttonVisibility = "button_visibility"
    static let cancelButtonVisiblity = "cancel_button_visibility"
    static let holderfamilymember = "holder_family_member"
    static let holderBookingDetails = "holder_corporate_bookings"
  }

  // MARK: Properties
    public var holderReceipt: RideDetailsHolderReceipt?
    public var holderPickdropLocation: RideDetailsHolderPickdropLocation?
    public var holderMapImage: RideDetailsHolderMapImage?
    public var holderUser: RideDetailsHolderUser?
    public var holderMetering: RideDetailsHolderMetering?
    public var holderBookingDescription: RideDetailsHolderBookingDescription?
    public var buttonVisibility: RideDetailsButtonVisibility?
    public var cancelButtonVisiblity: CancelDetailsButtonVisiblity?
    public var holderfamilymember: HolderFamilyMember?
    public var holderBookingDetails: holderCorporateBookings?


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
    holderReceipt <- map[SerializationKeys.holderReceipt]
    holderPickdropLocation <- map[SerializationKeys.holderPickdropLocation]
    holderMapImage <- map[SerializationKeys.holderMapImage]
    holderUser <- map[SerializationKeys.holderUser]
    holderMetering <- map[SerializationKeys.holderMetering]
    holderBookingDescription <- map[SerializationKeys.holderBookingDescription]
    buttonVisibility <- map[SerializationKeys.buttonVisibility]
    cancelButtonVisiblity <- map[SerializationKeys.cancelButtonVisiblity]
    holderfamilymember <- map[SerializationKeys.holderfamilymember]
      holderBookingDetails <- map[SerializationKeys.holderBookingDetails]

  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = holderReceipt { dictionary[SerializationKeys.holderReceipt] = value.dictionaryRepresentation() }
    if let value = holderPickdropLocation { dictionary[SerializationKeys.holderPickdropLocation] = value.dictionaryRepresentation() }
    if let value = holderMapImage { dictionary[SerializationKeys.holderMapImage] = value.dictionaryRepresentation() }
    if let value = holderUser { dictionary[SerializationKeys.holderUser] = value.dictionaryRepresentation() }
    if let value = holderMetering { dictionary[SerializationKeys.holderMetering] = value.dictionaryRepresentation() }
    if let value = holderBookingDescription { dictionary[SerializationKeys.holderBookingDescription] = value.dictionaryRepresentation() }
    if let value = buttonVisibility { dictionary[SerializationKeys.buttonVisibility] = value.dictionaryRepresentation() }
    if let value = cancelButtonVisiblity { dictionary[SerializationKeys.cancelButtonVisiblity] = value.dictionaryRepresentation() }
     if let value = holderfamilymember { dictionary[SerializationKeys.holderfamilymember] = value.dictionaryRepresentation() }
      if let value = holderBookingDetails { dictionary[SerializationKeys.holderBookingDetails] = value.dictionaryRepresentation() }

      return dictionary
  }
}
