//
//  ExternalWebLInkView.swift
//  Africa
//
//  Created by wac on 14/07/23.
//

import SwiftUI

struct ExternalWebLInkView: View {
    //MARK: - properties
    
    let animal: Animal
    
    //MARK: - Body
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }.foregroundColor(.accentColor)
            }
        }
    }
}

//MARK: - preview
struct ExternalWebLInkView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWebLInkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
