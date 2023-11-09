//
//  ContentView.swift
//  mapRoute
//
//  Created by Lasse Durucz on 17/10/2023.
//

import SwiftUI
import MapKit



struct ContentView: View {
  
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
    static let empireStateBuilding = CLLocationCoordinate2D(latitude: 40.7484, longitude: -73.9857)
    static let columbiaUniversity = CLLocationCoordinate2D(latitude: 40.8075, longitude: -73.9626)
}
