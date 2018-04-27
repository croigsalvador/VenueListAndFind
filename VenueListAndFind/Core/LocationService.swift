//
//  LocationContainer.swift
//  Vitcord
//
//  Created by Victor on 16/11/16.
//  Copyright © 2016 Vitcord. All rights reserved.
//

import CoreLocation
import Swinject

class LocationService: NSObject {
 
  enum LocationError: Error {
    case needsPermissions
  }
  
  let locationManager: CLLocationManager
  
  var locationHandler: (CLLocationCoordinate2D?, Error?) -> () = { _,_  in }
  
  required init(_ locationManager: CLLocationManager = CLLocationManager()) {
    self.locationManager = locationManager
    super.init()
    
    self.locationManager.delegate = self
  }
  
  func userLocation(_ completion: @escaping (CLLocationCoordinate2D?, Error?) -> ()) {
    switch CLLocationManager.authorizationStatus().map() {
    case .authorized:
      locationHandler = completion
      locationManager.requestLocation()
    case .denied, .notDetermined:
      completion(nil, LocationError.needsPermissions)
    }
  }
}

extension LocationService: CLLocationManagerDelegate {
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    locationHandler(locations.first?.coordinate, nil)
    locationHandler = { _,_  in }
    locationManager.stopUpdatingLocation()
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    locationHandler(nil, error)
    locationHandler = { _,_  in }
    locationManager.stopUpdatingLocation()
  }
}

extension LocationService: VitcordBundle {
  
  func create(_ parent: Container) {
    
    parent.register(LocationService.self) { c in
      return LocationService()
    }
  }
}
