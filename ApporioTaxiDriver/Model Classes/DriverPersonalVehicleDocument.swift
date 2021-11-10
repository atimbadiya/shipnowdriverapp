//
//  VehicleDocument.swift
//
//  Created by Atul Jain on 04/07/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverPersonalVehicleDocument: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let vehicleNumberPlateImage = "vehicle_number_plate_image"
    static let vehicleImage = "vehicle_image"
    static let vehicleDocuments = "vehicle_documents"
    static let id = "id"
    static let vehicleVerficationStatus = "vehicle_verfication_status"
    static let vehiclenumber = "vehicle_number"
    static let vehicletype = "vehicle_type"
    static let vehiclemodel = "vehicle_model"
  }
    

  // MARK: Properties
  public var vehicleNumberPlateImage: String?
  public var vehicleImage: String?
  public var vehicleDocuments: [DriverPersonalVehicleDocuments]?
  public var id: Int?
  public var vehicleVerficationStatus: Int?
  public var vehiclenumber: String?
  public var vehicletype: String?
  public var vehiclemodel: String?

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
    vehicleNumberPlateImage <- map[SerializationKeys.vehicleNumberPlateImage]
    vehicleImage <- map[SerializationKeys.vehicleImage]
    vehicleDocuments <- map[SerializationKeys.vehicleDocuments]
    id <- map[SerializationKeys.id]
    vehicleVerficationStatus <- map[SerializationKeys.vehicleVerficationStatus]
    vehiclenumber <- map[SerializationKeys.vehiclenumber]
    vehicletype <- map[SerializationKeys.vehicletype]
    vehiclemodel <- map[SerializationKeys.vehiclemodel]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = vehicleNumberPlateImage { dictionary[SerializationKeys.vehicleNumberPlateImage] = value }
    if let value = vehicleImage { dictionary[SerializationKeys.vehicleImage] = value }
    if let value = vehicleDocuments { dictionary[SerializationKeys.vehicleDocuments] = value.map { $0.dictionaryRepresentation() } }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = vehicleVerficationStatus { dictionary[SerializationKeys.vehicleVerficationStatus] = value }
    if let value = vehiclenumber { dictionary[SerializationKeys.vehiclenumber] = value }
    if let value = vehicletype { dictionary[SerializationKeys.vehicletype] = value }
    if let value = vehiclemodel { dictionary[SerializationKeys.vehiclemodel] = value }
    return dictionary
  }

}
