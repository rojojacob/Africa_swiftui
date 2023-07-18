//
//  ContentView.swift
//  Africa
//
//  Created by wac on 13/07/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive: Bool = false
   
//    // setting up grid layout '2'
//        let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    //setting up new way of grid for better advanced look
    @State private var gridLayout: [GridItem] = [GridItem(.flexible()) ]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    
    //MARK: Functions
    func  gridSwitch() {
        
        //CALCULATION: here we take the reminder and then add one to it to get the next grid value
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("grid Number: \(gridColumn)")
        
        //TOOLBAR Image
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
            default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    //MARK: - BODY
    var body: some View {
        
       
        
        NavigationView {
            
            Group {
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                            
                        }
                    }//: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center , spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }//: link
                            }//: loop
                        }//:Grid
                        //padding to grid so that it wont touch the edge of the screen
                        .padding(10)
                        .animation(.easeIn)
                    }//:scroll
                    
                }//:Condition
            }//: Group
            
            
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16){
                        Button(action: {
                            print("List vies is activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor) // switch color etween 2 buttons
                        }
                        
                        Button(action: {
                            print("grid view is activated ")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }) {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary) // switch color etween 2 buttons
                        }
                    }
                }
                
            }
        }//: Navigation
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
