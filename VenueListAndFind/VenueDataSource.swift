//
//  VenueDataSource.swift
//  VenueListAndFind
//
//  Created by Carlos Roig on 27/4/18.
//  Copyright © 2018 Carlos Roig. All rights reserved.
//

import Foundation

struct VenueViewModel {
    let name: String
}


struct VenueDataSource {
    
    let venues: [VenueViewModel] = [VenueViewModel.init(name: "Place 1"),
                                    VenueViewModel.init(name: "Place 2"),
                                    VenueViewModel.init(name: "Place 3")]
    
}
