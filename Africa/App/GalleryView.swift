//
//  GalleryView.swift
//  Africa
//
//  Created by wac on 14/07/23.
//

import SwiftUI

struct GalleryView: View {
    //MARK: properties
    @State private var selectedAnimal: String = "lion"
  let haptic = UIImpactFeedbackGenerator(style: .medium)
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    //let gridLayout: [GridItem] = [
    //    GridItem(.flexible()),
    //    GridItem(.flexible()),
    //    GridItem(.flexible())
    //]
    
    //EFFICIENT GRID DEFINITION
//    let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    //Dynamic grid layout
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColum : Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColum))
    }
    
    //MARK: body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                //MARK: - GRID
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                
                //MARK: slider
                
                Slider(value: $gridColum, in: 2...6, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColum, perform: { value in
                        gridSwitch()
                    })
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptic.impactOccurred()
                            }
                    }
                }
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }//: scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView()                   )
    }
}


//MARK: Preview
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
