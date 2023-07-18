//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by wac on 18/07/23.
//

import SwiftUI

struct AnimalGridItemView: View {
    //MARK: Properties
    let animal: Animal
    
    //MARK: BODY
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

//MARK: preview
struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
