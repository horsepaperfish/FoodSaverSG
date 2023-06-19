//
//  Location.swift
//  iExpire
//
//  Created by Ma Zhiyu on 18/6/23.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    
    let name: String // name of place
    let cityName: String //postal code
    let coordinates: CLLocationCoordinate2D // coordinates
    let description: String // where in the place, street name, time of opening
    let imageNames: [String] // image
    let link: String
    
    //Identifiable
    var id: String{
        name + cityName
    }
    
    //equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}

//
