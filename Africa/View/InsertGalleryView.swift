//
//  InsertGalleryView.swift
//  Africa
//
//  Created by wac on 14/07/23.
//

import SwiftUI

struct InsertGalleryView: View {
    
    //MARK: - Properties
    let animal: Animal
    //MARK: - Body
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }
            }
        }
        
    }
}


//MARK: - Preview
struct InsertGalleryView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsertGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
