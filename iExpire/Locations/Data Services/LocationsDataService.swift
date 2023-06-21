//
//  LocationsDataService.swift
//  iExpire
//
//  Created by Ma Zhiyu on 18/6/23.
//

// name: name
// cityName: postal code
// coordinates: (latitude: ___, longitude: ___)
// description: street name, specific place, time of opening
// image: image

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "Bedok Point",
            cityName: "467351",
            coordinates: CLLocationCoordinate2D(latitude: 1.324570, longitude: 103.934160),
            description: "Street Name: 799 New Upper Changi Road \nPlace: Level 3 Customer Service \nTime of Opening: 11am-10pm",
            imageNames: [ "bedok-point", ],
            link: "https://en.wikipedia.org/wiki/Colosseum"),
//        Location(
//            name: "Century Square",
//            cityName: "529509",
//            coordinates: CLLocationCoordinate2D(latitude: 1.351700, longitude: 103.351700),
//            description: "Street Name: 2 Tampines Central 5 \nPlace: Level 1 Information Counter \nTime of Opening: 10am-10pm",
//            imageNames: [ "century-square", ],
//            link: "https://en.wikipedia.org/wiki/Pantheon,_Rome"),
//        Location(
//            name: "Changi City Point",
//            cityName: "486038",
//            coordinates: CLLocationCoordinate2D(latitude: 1.331700, longitude: 103.331700),
//            description: "Street Name: 5 Changi Business Park Central 1 \nPlace: Level 2 Customer Service \nTime of Opening: 10am-9.30pm",
//            imageNames: [ "changi-city-point", ],
//            link: "https://en.wikipedia.org/wiki/Trevi_Fountain"),
        Location(
            name: "Kallang Leisure Park",
            cityName: "397693",
            coordinates: CLLocationCoordinate2D(latitude: 1.302090, longitude: 103.877183),
            description: "Street Name: 5 Stadium Walk \nPlace: Cold Storage, #b1-01/05 \nTime of Opening: 10am-10pm",
            imageNames: [ "kallang-leisure-park", ],
            link: "https://en.wikipedia.org/wiki/Eiffel_Tower"),
        Location(
            name: "EastPoint Mall",
            cityName: "528833",
            coordinates: CLLocationCoordinate2D(latitude: 1.3427071, longitude: 103.9531057),
            description: "Street Name: 3 Simei Street \nPlace: Level 5 \nTime of Opening: 10am-10pm",
            imageNames: [ "eastpoint-mall", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Giant Hypermarket",
            cityName: "528765",
            coordinates: CLLocationCoordinate2D(latitude: 1.3721219, longitude:  103.9320004),
            description: "Street Name: 21 Tampines North Drive 2 \nPlace: #03-01 \nTime of Opening: 9am-10pm",
            imageNames: [ "giant-hypermarket", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Heartbeat @ Bedok",
            cityName: "469662",
            coordinates: CLLocationCoordinate2D(latitude: 1.326735, longitude: 103.9318058),
            description: "Street Name: 11 Bedok North Street 1 \nPlace: Level 1 \nTime of Opening: 24 hours",
            imageNames: [ "heartbeat-bedok", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "PLQ Mall",
            cityName: "409057",
            coordinates: CLLocationCoordinate2D(latitude: 1.3175856, longitude: 103.8929249),
            description: "Street Name: 10 Paya Lebar Road \nPlace: Level 5 \nTime of Opening: 9am-10pm",
            imageNames: [ "plq-mall", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Tampines 1",
            cityName: "529536",
            coordinates: CLLocationCoordinate2D(latitude: 1.3541265, longitude: 103.9451179),
            description: "Street Name: 10 Tampines Central 1 \nPlace: B1 Information Counter \nTime of Opening: 10am-10pm",
            imageNames: [ "tampines-1", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "White Sands Mall",
            cityName: "518457",
            coordinates: CLLocationCoordinate2D(latitude: 1.3723864, longitude: 103.9497161),
            description: "Street Name: 1 Pasir Ris Central Street 3 \nPlace: Level 2 Customer Service \nTime of Opening: 10am-10pm",
            imageNames: [ "white-sands-mall", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Compass One Mall",
            cityName: "545078",
            coordinates: CLLocationCoordinate2D(latitude: 1.3925803, longitude: 103.8952498),
            description: "Street Name: 1 Sengkang Square \nPlace: Level 1 \nTime of Opening: 10am-10pm",
            imageNames: [ "compass-one-mall", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Hougang Mall",
            cityName: "538766",
            coordinates: CLLocationCoordinate2D(latitude: 1.3724356, longitude: 103.8938249),
            description: "Street Name: 90 Hougang Avenue 10 \nPlace: Level 3 \nTime of Opening: 10am-10pm",
            imageNames: [ "hougang-mall", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Waterway Point",
            cityName: "529536",
            coordinates: CLLocationCoordinate2D(latitude: 1.4065692, longitude: 103.9020887),
            description: "Street Name: 83 Punggol Central \nPlace: East Wing Level 1 \nTime of Opening: 10am-10pm",
            imageNames: [ "waterway-point", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Causeway Point 1",
            cityName: "738099",
            coordinates: CLLocationCoordinate2D(latitude: 1.4361897, longitude: 103.7858891),
            description: "Street Name: 1 Woodlands Square \nPlace: Level 2 Customer Service \nTime of Opening: 11am-10pm",
            imageNames: [ "causeway-point-1", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "NorthPoint City",
            cityName: "769098",
            coordinates: CLLocationCoordinate2D(latitude: 1.4292713, longitude: 103.8361478),
            description: "Street Name: 930 Yishun Avenue 2 \nPlace: North Wing Level 2 CUstomer Service \nTime of Opening: 11am-10pm",
            imageNames: [ "northpoint-city", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Sembawang Shopping Centre",
            cityName: "758459",
            coordinates: CLLocationCoordinate2D(latitude: 1.4417884, longitude: 103.8248968),
            description: "Street Name: 604 Sembawang Road \nPlace: Giant Hypermarket #B1-25 \nTime of Opening: 9am-10pm",
            imageNames: [ "sembawang-shopping-centre", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "THK Chong Pang Social Service Hub",
            cityName: "760131",
            coordinates: CLLocationCoordinate2D(latitude: 1.429218, longitude: 103.8377840),
            description: "Yishun Street 11 \nPlace: Blk 131 \nTime of Opening: Weekdays 10am-5pm",
            imageNames: [ "thk-chong-pang", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Wisteria Mall",
            cityName: "768698",
            coordinates: CLLocationCoordinate2D(latitude: 1.4182429, longitude: 103.8412528),
            description: "Street Name: 598 Yishun Ring Road \nPlace: B1 Information Counter \nTime of Opening: 10am-10pm",
            imageNames: [ "wisteria-mall", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "IMM",
            cityName: "609601",
            coordinates: CLLocationCoordinate2D(latitude: 1.3348133, longitude: 103.7468148),
            description: "Street Name: 2 Jurong East Street 21 \nPlace: Giant Hypermarket, #01-100 \nTime of Opening: 9am-10pm",
            imageNames: [ "imm", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Pioneer Mall",
            cityName: "640638",
            coordinates: CLLocationCoordinate2D(latitude: 1.3416305, longitude: 103.6971589),
            description: "Street Name: Jurong West Street 61 Blk 638 \nPlace: Giant Hypermarket, #03-01 \nTime of Opening: 9am-10pm",
            imageNames: [ "pioneer-mall", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Nanyang Technological University",
            cityName: "639816",
            coordinates: CLLocationCoordinate2D(latitude: 1.3483, longitude: 103.6831),
            description: "Street Name: 52 Nanyang Avenue \nPlace: The Hive, B5 \nTime of Opening: 8.30am-5pm",
            imageNames: [ "ntu", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "National University of Singapore",
            cityName: "138614",
            coordinates: CLLocationCoordinate2D(latitude: 1.2966, longitude: 103.7763),
            description: "Street Name: 6 College Avenue East \nPlace: Residential College 4, University Town, #01-01 \nTime of Opening: 8.30am-5pm",
            imageNames: [ "nus", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Alexandra Point",
            cityName: "119968",
            coordinates: CLLocationCoordinate2D(latitude: 1.2811, longitude: 103.8007),
            description: "Street Name: 438 Alexandra Road \nPlace: B1 Information Counter \nTime of Opening: 11am-9pm",
            imageNames: [ "alexandra-point", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Chrysler Jeep Automotive of Singapore",
            cityName: "159630",
            coordinates: CLLocationCoordinate2D(latitude: 1.2823, longitude: 103.8054),
            description: "Street Name: 1 Chang Charn Road \nPlace: Level 1 \nTime of Opening: 9am-5.30pm",
            imageNames: [ "chrysler-jeep", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Quayside Isle Sentosa Cove",
            cityName: "098375",
            coordinates: CLLocationCoordinate2D(latitude: 1.2457, longitude: 103.8354),
            description: "Street Name: 31 Ocean Way \nPlace: B1 \nTime of Opening: 10am-10pm",
            imageNames: [ "quayside-isle", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "City Square Mall",
            cityName: "208539",
            coordinates: CLLocationCoordinate2D(latitude: 1.3113, longitude: 103.8567),
            description: "Street Name: 180 Kitchener Road \nPlace:  \nTime of Opening: 10am-10pm",
            imageNames: [ "city-square-mall", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Jelita Shopping Centre",
            cityName: "278628",
            coordinates: CLLocationCoordinate2D(latitude: 1.3093, longitude: 103.7855),
            description: "Street Name: 293 Holland Road \nPlace: Cold Storage \nTime of Opening: 10am-10pm",
            imageNames: [ "jelita-shopping-centre", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Link@896",
            cityName: "598472",
            coordinates: CLLocationCoordinate2D(latitude: 1.3347, longitude: 103.7887),
            description: "Street Name:  \nPlace:  \nTime of Opening: 9am-10pm",
            imageNames: [ "link-896", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Great World",
            cityName: "237994",
            coordinates: CLLocationCoordinate2D(latitude: 1.2895, longitude: 103.8317),
            description: "Street Name: 1 Kim Seng Promenade \nPlace: Cold Storage, #B1-139 \nTime of Opening: 10am-10pm",
            imageNames: [ "great-world", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "The Adelphi",
            cityName: "179803",
            coordinates: CLLocationCoordinate2D(latitude: 1.2916, longitude: 103.8529),
            description: "Street Name: 1 Coleman Street \nPlace: Cross Street Exchange, #08-01 \nTime of Opening: 10am-10pm",
            imageNames: [ "the-adelphi", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Forum the Shopping Mall",
            cityName: "238884",
            coordinates: CLLocationCoordinate2D(latitude: 1.3066, longitude: 103.8286),
            description: "Street Name: 583 Orchard Road \nPlace: Level 2 Customer Service \nTime of Opening: 10am-9pm",
            imageNames: [ "forum-shopping-mall", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Frasers Cuppage",
            cityName: "229469",
            coordinates: CLLocationCoordinate2D(latitude: 1.3018, longitude: 103.8409),
            description: "Street Name: 51 Cuppage Road \nPlace: #01-06A \nTime of Opening: 9am-10pm",
            imageNames: [ "frasers-cuppage", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Frasers Tower",
            cityName: "069547",
            coordinates: CLLocationCoordinate2D(latitude: 1.2784, longitude: 103.8485),
            description: "Street Name: 182 Cecil Street \nPlace: Level 2 \nTime of Opening: 9am-6pm",
            imageNames: [ "frasers-tower", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Suntec City",
            cityName: "038983",
            coordinates: CLLocationCoordinate2D(latitude: 1.2931, longitude: 103.8576),
            description: "Street Name: 3 Temasek Boulevard \nPlace: Giant Hypermarket, #B1-154/155/156 \nTime of Opening: 9am-10pm",
            imageNames: [ "suntec-city", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Marina Bay Link Mall",
            cityName: "018984",
            coordinates: CLLocationCoordinate2D(latitude: 1.2795, longitude: 103.8533),
            description: "Street Name: 8A Marina Boulevard \nPlace: The Community Space #B2-10 \nTime of Opening: 9am-10pm",
            imageNames: [ "marina-bay-link-mall", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Market Place",
            cityName: "247933",
            coordinates: CLLocationCoordinate2D(latitude: 1.3083, longitude: 103.8225),
            description: "Street Name: 176 Orchard Road \nTime of Opening: 10am-10pm",
            imageNames: [ "market-place", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Robertson Walk",
            cityName: "237995",
            coordinates: CLLocationCoordinate2D(latitude: 1.2904, longitude: 103.8446),
            description: "Street Name: 11 Unity Street \nPlace: #02-20A \nTime of Opening: 11am-10pm",
            imageNames: [ "robertson-walk", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "The Centrepoint",
            cityName: "238843",
            coordinates: CLLocationCoordinate2D(latitude: 1.3016, longitude: 103.8394),
            description: "Street Name: 176 Orchard Road \nPlace: Customer Service at Level 3 \nTime of Opening: 10am-10pm",
            imageNames: [ "the-centrepoint", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Tiong Bahru Plaza",
            cityName: "168730",
            coordinates: CLLocationCoordinate2D(latitude: 1.2857, longitude: 103.8329),
            description: "Street Name: 298 Tiong Bahru Road \nPlace: Level 2 Information Counter \nTime of Opening: 10am-10pm",
            imageNames: [ "tiong-bahru-plaza", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Valley Point",
            cityName: "248371",
            coordinates: CLLocationCoordinate2D(latitude: 1.2942, longitude: 103.8296),
            description: "Street Name: 491 River Valley Road \nPlace: Basement Carpark \nTime of Opening: 11am-10pm",
            imageNames: [ "valleypoint1", ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
    ]
    
}
