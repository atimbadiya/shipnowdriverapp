//
//  Data.swift
//
//  Created by apple on 2/13/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverRecieptData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let bottomButton = "bottom_button"
    static let holderRideInfo = "holder_ride_info"
    static let holderInputInfo = "holder_input_info"
    static let paymentHolder = "payment_holder"
    static let holderDriverRidePayment = "holder_driver_ride_payment"
  }

  // MARK: Properties
  public var bottomButton: DriverRecieptBottomButton?
  public var holderRideInfo: DriverRecieptHolderRideInfo?
  public var holderInputInfo: DriverRecieptHolderInputInfo?
  public var paymentHolder: DriverRecieptPaymentHolder?
  public var holderDriverRidePayment: HolderDriverRidePayment?

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
    bottomButton <- map[SerializationKeys.bottomButton]
    holderRideInfo <- map[SerializationKeys.holderRideInfo]
    holderInputInfo <- map[SerializationKeys.holderInputInfo]
    paymentHolder <- map[SerializationKeys.paymentHolder]
     holderDriverRidePayment <- map[SerializationKeys.holderDriverRidePayment]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = bottomButton { dictionary[SerializationKeys.bottomButton] = value.dictionaryRepresentation() }
    if let value = holderRideInfo { dictionary[SerializationKeys.holderRideInfo] = value.dictionaryRepresentation() }
    if let value = holderInputInfo { dictionary[SerializationKeys.holderInputInfo] = value.dictionaryRepresentation() }
    if let value = paymentHolder { dictionary[SerializationKeys.paymentHolder] = value.dictionaryRepresentation() }
    if let value = holderDriverRidePayment { dictionary[SerializationKeys.holderDriverRidePayment] = value.dictionaryRepresentation() }
    return dictionary
  }

}
