//
//  CustomerQRdata.swift
//  ApporioTaxiDriver
//
//  Created by Ship Now 2 on 14/7/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import Foundation
import ObjectMapper

public struct CustomerQRdata: Mappable {
  
    //MARK: Declaration for string constants to be used to decode and also serialize.
    
    
    private struct SerializationKeys {
        static let id = "id"
        static let tracking_id = "tracking_id"
        static let corporate_id = "corporate_id"
        static let corporate_substation = "corporate_substation"
        static let booking_id = "booking_id"
        static let product_id = "product_id"
        static let dsco_poNumber = "dsco_poNumber"
        static let receiver_name = "receiver_name"
        static let receiver_contact_number = "receiver_contact_number"
        static let receiver_email = "receiver_email"
        static let delivery_address = "delivery_address"
        static let delivery_postcode = "delivery_postcode"
        static let delivery_state = "delivery_state"
        static let delivery_suburb = "delivery_suburb"
        static let delivery_latitude = "delivery_latitude"
        static let delivery_longitude = "delivery_longitude"
        static let delivery_instructions = "delivery_instructions"
        static let additional_info = "additional_info"
        static let authority_to_leave = "authority_to_leave"
        static let user_email = "user_email"
        static let user_first_name = "user_first_name"
        static let pickup_address = "pickup_address"
        static let pickup_longitude = "pickup_longitude"
        static let pickup_latitude = "pickup_latitude"
        static let receiver_reference = "receiver_reference"
        static let product = "product"
        static let booking_status = "booking_status"
        static let quoted_amount = "quoted_amount"
        static let product_weight = "product_weight"
        static let product_quantity = "product_quantity"
        static let product_quantity_collected = "product_quantity_collected"
        static let product_quantity_collect_message = "product_quantity_collect_message"

        static let courier = "courier"
        static let courier_type = "courier_type"
        static let product_label = "product_label"
        static let driver_id = "driver_id"
        static let schedule_date = "schedule_date"
        static let user_last_name = "user_last_name"
        static let receiver_invoice = "receiver_invoice"
        static let geo_map_distance_short = "geo_map_distance_short"
        static let customer_qr_code = "customer_qr_code"
        static let scanned_product_label = "scanned_product_label"

    }
    
    public var id : Int?
    public var tracking_id : String?
    public var corporate_id : String?
    public var corporate_substation : String?
    public var booking_id : Int?
    public var product_id : String?
    public var dsco_poNumber: String?
    public var receiver_name : String?
    public var receiver_contact_number : String?
    public var receiver_email : String?
    public var delivery_address : String?
    public var delivery_postcode : String?
    public var delivery_state : String?
    public var delivery_suburb : String?
    public var delivery_latitude : String?
    public var delivery_longitude : String?
    public var delivery_instructions : String?
    public var additional_info : String?
    public var authority_to_leave : String?
    public var user_email : String?
    public var user_first_name : String?
    public var pickup_address : String?
    public var pickup_longitude : String?
    public var pickup_latitude : String?
    public var receiver_reference : String?
    public var product : String?
    public var booking_status : String?
    public var quoted_amount : Int?
    public var product_weight : String?
    public var product_quantity : Int?
    public var product_quantity_collected : Int?
    public var product_quantity_collect_message: String?
    
    public var courier : String?
    public var courier_type : String?
    public var product_label : [String]?
    public var driver_id : String?
    public var schedule_date : String?
    public var user_last_name : String?
    public var receiver_invoice : String?
    public var geo_map_distance_short : Int?
    public var customer_qr_code : String?
    public var scanned_product_label : [String]?

    
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        id <- map[SerializationKeys.id]
        tracking_id <- map[SerializationKeys.tracking_id]
        corporate_id <- map[SerializationKeys.corporate_id]
        corporate_substation <- map[SerializationKeys.corporate_substation]
        booking_id <- map[SerializationKeys.booking_id]
        product_id <- map[SerializationKeys.product_id]
        dsco_poNumber <- map[SerializationKeys.dsco_poNumber]
        receiver_name <- map[SerializationKeys.receiver_name]
        receiver_contact_number <- map[SerializationKeys.receiver_contact_number]
        receiver_email <- map[SerializationKeys.receiver_email]
        delivery_address <- map[SerializationKeys.delivery_address]
        delivery_postcode <- map[SerializationKeys.delivery_postcode]
        delivery_state <- map[SerializationKeys.delivery_state]
        delivery_suburb <- map[SerializationKeys.delivery_suburb]
        delivery_latitude <- map[SerializationKeys.delivery_latitude]
        delivery_longitude <- map[SerializationKeys.delivery_longitude]
        delivery_instructions <- map[SerializationKeys.delivery_instructions]
        additional_info <- map[SerializationKeys.additional_info]
        authority_to_leave <- map[SerializationKeys.authority_to_leave]
        user_email <- map[SerializationKeys.user_email]
        user_first_name <- map[SerializationKeys.user_first_name]
        pickup_address <- map[SerializationKeys.pickup_address]
        pickup_longitude <- map[SerializationKeys.pickup_longitude]
        pickup_latitude <- map[SerializationKeys.pickup_latitude]
        receiver_reference <- map[SerializationKeys.receiver_reference]
        product <- map[SerializationKeys.product]
        booking_status <- map[SerializationKeys.booking_status]
        quoted_amount <- map[SerializationKeys.quoted_amount]
        product_weight <- map[SerializationKeys.product_weight]
        product_quantity <- map[SerializationKeys.product_quantity]
        product_quantity_collected <- map[SerializationKeys.product_quantity_collected]
        product_quantity_collect_message <- map[SerializationKeys.product_quantity_collect_message]

        
        courier <- map[SerializationKeys.courier]
        courier_type <- map[SerializationKeys.courier_type]
        product_label <- map[SerializationKeys.product_label]
        driver_id <- map[SerializationKeys.driver_id]
        schedule_date <- map[SerializationKeys.schedule_date]
        user_last_name <- map[SerializationKeys.user_last_name]
        receiver_invoice <- map[SerializationKeys.receiver_invoice]
        geo_map_distance_short <- map[SerializationKeys.geo_map_distance_short]
        customer_qr_code <- map[SerializationKeys.customer_qr_code]
        scanned_product_label <- map[SerializationKeys.scanned_product_label]

    }
    
    public func dictionaryRepresentation() -> [String: Any] {
      var dictionary: [String: Any] = [:]
        dictionary[SerializationKeys.id] = id
        dictionary[SerializationKeys.tracking_id] = tracking_id
        dictionary[SerializationKeys.corporate_id] = corporate_id
        dictionary[SerializationKeys.corporate_substation] = corporate_substation
        dictionary[SerializationKeys.booking_id] = booking_id
        dictionary[SerializationKeys.product_id] = product_id
        dictionary[SerializationKeys.dsco_poNumber] = dsco_poNumber
        dictionary[SerializationKeys.receiver_name] = receiver_name
        dictionary[SerializationKeys.receiver_contact_number] = receiver_contact_number
        dictionary[SerializationKeys.receiver_email] = receiver_email
        dictionary[SerializationKeys.delivery_address] = delivery_address
        dictionary[SerializationKeys.delivery_postcode] = delivery_postcode
        dictionary[SerializationKeys.delivery_state] = delivery_state
        dictionary[SerializationKeys.delivery_suburb] = delivery_suburb
        dictionary[SerializationKeys.delivery_latitude] = delivery_latitude
        dictionary[SerializationKeys.delivery_longitude] = delivery_longitude
        dictionary[SerializationKeys.delivery_instructions] = delivery_instructions
        dictionary[SerializationKeys.additional_info] = additional_info
        dictionary[SerializationKeys.authority_to_leave] = authority_to_leave
        dictionary[SerializationKeys.user_email] = user_email
        dictionary[SerializationKeys.user_first_name] = user_first_name
        dictionary[SerializationKeys.pickup_address] = pickup_address
        dictionary[SerializationKeys.pickup_longitude] = pickup_longitude
        dictionary[SerializationKeys.pickup_latitude] = pickup_latitude
        dictionary[SerializationKeys.receiver_reference] = receiver_reference
        dictionary[SerializationKeys.product] = product
        dictionary[SerializationKeys.booking_status] = booking_status
        dictionary[SerializationKeys.quoted_amount] = quoted_amount
        dictionary[SerializationKeys.product_weight] = product_weight
        dictionary[SerializationKeys.product_quantity] = product_quantity
        dictionary[SerializationKeys.product_quantity_collected] = product_quantity_collected
        dictionary[SerializationKeys.product_quantity_collect_message] = product_quantity_collect_message

        dictionary[SerializationKeys.courier] = courier
        dictionary[SerializationKeys.courier_type] = courier_type
        dictionary[SerializationKeys.product_label] = product_label
        dictionary[SerializationKeys.driver_id] = driver_id
        dictionary[SerializationKeys.schedule_date] = schedule_date
        dictionary[SerializationKeys.user_last_name] = user_last_name
        dictionary[SerializationKeys.receiver_invoice] = receiver_invoice
        dictionary[SerializationKeys.geo_map_distance_short] = geo_map_distance_short
        dictionary[SerializationKeys.customer_qr_code] = customer_qr_code
        dictionary[SerializationKeys.scanned_product_label] = scanned_product_label

        return dictionary
    }
}
