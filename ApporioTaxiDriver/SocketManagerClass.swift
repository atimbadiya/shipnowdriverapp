//
//  SocketManager.swift
//  ApporioTaxiDriver
//
//  Created by Atul Jain on 11/06/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import Foundation
import SocketIO

class SocketManagerClass: NSObject  {
    
    
     static let sharedInstance = SocketManagerClass()

    static let manager = SocketManager(socketURL: URL(string: "http://13.235.74.180:8080/")!, config: [.log(true), .compress])
    
    static let socket = manager.defaultSocket
    
    override init() {
        super.init()
        
        // socket = manager.defaultSocket
    
//        SocketManagerClass.socket.on("onLocationUpdate") { dataArray, ack in
//            print(dataArray)
//        }
        
        
        
        
    }
    
    
    func testingcall(Value: String,Counter: String,senttime: String){
        
//        let myjson = ["test_data": Value,
//                      "counter":Counter,
//                      "sent_time":senttime,
//
//
//        ]
//
//        SocketManagerClass.socket.emitWithAck("writeTestData", myjson).timingOut(after: 0) {data in
//            print("bookingCoordinatePhp\(data)")
//
//        }
        
    }
    
    func endrideevent(BookingId: String,BookingStatus: String){
        
        
//        let myjson = ["booking_id": BookingId,
//                      "booking_status": BookingStatus
//
//        ]
//
//        SocketManagerClass.socket.emitWithAck("bookingCoordinatePhp", myjson).timingOut(after: 0) {data in
//            print("bookingCoordinatePhp\(data)")
//
//        }
    }
    
    
    func savedrivertrackinglatlng(Currentlat: String,Currentlng: String,Droplat: String,Droplng: String,BookingId: String,DriverId: String,Polyline: String,GoogleKey: String,Bearning: String,Accuracy: String,BookingStatus: String,BookingEta: String,DistanceUnit: String){
        
        
//        SocketManagerClass.sharedInstance.establishConnection()
//
//
//
//       let myjson = ["booking_id": BookingId,
//        "driver_id": DriverId,
//        "movable_latitude": Currentlat,
//        "movable_longitude": Currentlng,
//        "still_latitude": Droplat,
//        "still_longitude": Droplng,
//        "polyline": Polyline,
//        "google_key": GoogleKey,
//        "bearning":Bearning,
//        "accuracy": Accuracy,
//        "booking_status":BookingStatus,
//        "booking_eta":BookingEta,
//        "distance_unit":DistanceUnit
//
//        ]
//
//
//        SocketManagerClass.socket.emitWithAck("saveDriverTracking", myjson).timingOut(after: 0) {data in
//            print("saveDriverTracking\(data)")
//
//        }
        
        
    
        
        
    }
    
    
    func listentrackingdata(BookingId: String){
        
        
        
//        SocketManagerClass.socket.on(BookingId) { ( dataArray, ack) -> Void in
//
//
//          let dataobject = dataArray[0]
//
//            let dataaaa = self.json(from: dataobject as Any)
//
//            let jsonData =  ListenTrackingModel(JSONString: dataaaa!)
//
//
//            AppConstants.trackingdata =  jsonData
//
//
//              NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trackingdata"), object: nil, userInfo: nil)
//
////            print(dataArray.count)
////
////            print(dataArray)
   //     }
        
    }
    
    func json(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }

    
   
    
    
    func receivemessage(){
        
        
        SocketManagerClass.socket.on("driverTrackingSaved") { (dataArray, ack) in
            print(dataArray.count)
        }
        
        
    }
    
    
    
    func EmitCode(Latitude: String,Longitude: String,DriverId: String,Bearning: String,Accuracy: String,LiveStatus: String){
        
        
        // SocketManagerClass.sharedInstance.establishConnection()
//        let socketConnectionStatus = SocketManagerClass.socket.status
//
//        switch socketConnectionStatus {
//        case SocketIOStatus.connected:
//
//
//            let myjson = ["driver_id":DriverId,
//                          "latitude":Latitude,
//                          "longitude":Longitude,
//                          "bearing":Bearning,
//                          "accuracy":Accuracy,
//                          "live_status":LiveStatus,
//                          "google_key":"",
//                          "background_booking_id":""
//            ]
//
//
//            SocketManagerClass.socket.emitWithAck("saveDriverLatLong", myjson).timingOut(after: 0) {data in
//                print("saveDriverLatLong\(data)")
//
//            }
//
//
//            print("socket connected")
//        case SocketIOStatus.connecting:
//            print("socket connecting")
//
//            //  SocketManagerClass.socket.emit("driverConnection", "data")
//
//            //  SocketManagerClass.socket.connect()
//
//        case SocketIOStatus.disconnected:
//
//            //   SocketManagerClass.socket.emit("driverConnection", "data")
//
//            SocketManagerClass.socket.connect()
//            print("socket disconnected")
//        case SocketIOStatus.notConnected:
//
//            //   SocketManagerClass.socket.emit("driverConnection", "data")
//
//            SocketManagerClass.socket.connect()
//            print("socket not connected")
//        }
//
       
      
        
    }
    
    
    func establishConnection() {
        
        
//        let socketConnectionStatus = SocketManagerClass.socket.status
//
//        switch socketConnectionStatus {
//        case SocketIOStatus.connected:
//            print("socket connected")
//        case SocketIOStatus.connecting:
//            print("socket connecting")
//
//          //  SocketManagerClass.socket.emit("driverConnection", "data")
//
//          //  SocketManagerClass.socket.connect()
//
//        case SocketIOStatus.disconnected:
//
//         //   SocketManagerClass.socket.emit("driverConnection", "data")
//
//            SocketManagerClass.socket.connect()
//            print("socket disconnected")
//        case SocketIOStatus.notConnected:
//
//         //   SocketManagerClass.socket.emit("driverConnection", "data")
//
//            SocketManagerClass.socket.connect()
//            print("socket not connected")
//        }
     
        
    }
    
    func closeConnection() {
        SocketManagerClass.socket.disconnect()
    }
    
    
}
