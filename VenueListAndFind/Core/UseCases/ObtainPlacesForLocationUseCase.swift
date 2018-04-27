//
//  ObtainPlacesForLocationUseCase.swift
//  VenueListAndFind
//
//  Created by Carlos Roig on 27/4/18.
//  Copyright © 2018 Carlos Roig. All rights reserved.
//

import Foundation
import CoreLocation
import GooglePlaces

protocol ObtainVenuesForLocationUseCase {
    func obtainVenues(for location: CLLocation, with completion: @escaping ([VenueViewModel]) ->())
}


struct ObtainGoogleVenuesForLocation: ObtainVenuesForLocationUseCase {
    
    fileprivate let placesClient = GMSPlacesClient.shared()
    
    init(_ placesClient: GSMPLA)
    
    func obtainVenues(for location: CLLocation, with completion: @escaping ([VenueViewModel]) -> ()) {
        
    }
}
