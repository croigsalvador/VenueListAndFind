//
//  GetUserLocationUseCase.swift
//  VenueListAndFind
//
//  Created by Carlos Roig on 27/4/18.
//  Copyright © 2018 Carlos Roig. All rights reserved.
//

import Foundation
import CoreLocation

protocol GetUserLocationUseCase {
    func execute(callback: CLLocation -> ())
}


struct GetUserLocation: GetUserLocationUseCase {
    
    fileprivate let location: LocationService
    
    func execute(callback: (CLLocation?) -> ()) {
        
        location.userLocation { (locationCoordinate, error) in
            guard let latitude = locationCoordinate?.latitude,
                let longitude = locationCoordinate?.longitude else {
                    callback(nil)
                    return
            }
            
            callback(CLLocation(latitude: latitude, longitude:longitude ))
        }
        
    }
    
    
}
