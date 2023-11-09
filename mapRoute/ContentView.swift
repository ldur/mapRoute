//
//  ContentView.swift
//  mapRoute
//
//  Created by Lasse Durucz on 17/10/2023.
//

import SwiftUI
import MapKit

import CoreLocation

struct MapLocation: Identifiable {
    let id: UUID
    let name: String
    let location: CLLocationCoordinate2D
    
    init(name: String, latitude: Double, longitude: Double) {
        self.id = UUID()
        self.name = name
        self.location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    // Method to find a location by name
    static func findLocation(by name: String, in locations: [MapLocation]) -> MapLocation? {
        return locations.first { $0.name == name }
    }
}

// Example locations around Oslo
let osloLocations = [
    MapLocation(name: "Oslo Opera House", latitude: 59.9075, longitude: 10.753),
    MapLocation(name: "Vigeland Park", latitude: 59.9269, longitude: 10.7031),
    MapLocation(name: "Royal Palace", latitude: 59.9165, longitude: 10.7270),
    MapLocation(name: "Akershus Fortress", latitude: 59.9070, longitude: 10.7375)
]


struct ContentView: View {
    
    // Example usage:
    let foundLocation = MapLocation.findLocation(by: "Oslo Opera House", in: osloLocations)
  
    @State private var selectedTag: Int?

   
    var body: some View {
        Map(selection: $selectedTag) {
            Marker("Empire state building", coordinate: .empireStateBuilding)
                .tint(.orange)
                .tag(1)
            Annotation("Columbia University", coordinate: .columbiaUniversity) {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.teal)
                    Text("🎓")
                        .padding(5)
                }
            }
        }
        .tag(2)
        .mapStyle(.standard(elevation: .realistic))
        .mapControls {
            MapUserLocationButton()
            MapCompass()
            MapScaleView()
        }
    }
}

#Preview {
    ContentView()
}
extension CLLocationCoordinate2D {
    static let weequahicPark = CLLocationCoordinate2D(latitude: 40.7063, longitude: -74.1973)
    static let empireStateBuilding = CLLocationCoordinate2D(latitude: 59.9075, longitude: 10.753)
    static let columbiaUniversity = CLLocationCoordinate2D(latitude: 59.9269, longitude: 10.7031)
}
