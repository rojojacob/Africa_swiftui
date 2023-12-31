//
//  InsertMapView.swift
//  Africa
//
//  Created by wac on 14/07/23.
//

import SwiftUI
import MapKit

struct InsertMapView: View {
    //MARK: - Properties
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    //MARK: - body
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(NavigationLink(destination: MapView()) {
                HStack {
                    Image(systemName: "mappin.circle")
                        .foregroundColor(.accentColor)
                        .imageScale(.large)
                    
                    Text("Locations")
                        .foregroundColor(.accentColor)
                        .fontWeight(.bold)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 14)
                .background(Color.black
                    .opacity(0.4)
                    .cornerRadius(8)
                )
                
            }
                .padding(12) , alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}

//MARK: - Preview
struct InsertMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsertMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
