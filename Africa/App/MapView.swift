//
//  MapView.swift
//  Africa
//
//  Created by wac on 14/07/23.
//

import SwiftUI
import MapKit



struct MapView: View {
    //MARK: - properties
    @State private var region: MKCoordinateRegion = {
        var mapCoordinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinate, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    //MARK: - body
    var body: some View {
//MARK: - no1 Basic map
       // Map(coordinateRegion: $region)
        
        //MARK: - advanced map usage
        
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {
            item in
            
            //{A} PIN: old style
//            MapPin(coordinate: item.location, tint: .accentColor)
            
            //{B} MARKER : new style
//            MapMarker(coordinate: item.location, tint: .accentColor)
            
            //{C} Custom BAsic annotations (which is intractive)
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            }
            // [D] Custom Advanced annotation
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        })
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                .resizable()
                .scaledToFit()
            .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding()
            , alignment: .top
        )
        
    }
}

//MARK: - preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
