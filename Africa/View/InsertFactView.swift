//
//  InsertFactView.swift
//  Africa
//
//  Created by wac on 14/07/23.
//

import SwiftUI

struct InsertFactView: View {
    
    //MARK: -  properties
    let animal: Animal
    
    //MARK: - body
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minWidth: 148, idealHeight: 168, maxHeight: 180)
        }//: Box
    }
}

//MARK: -Preview

struct InsertFactView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsertFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
