//
//  VideoPlayerView.swift
//  Africa
//
//  Created by wac on 17/07/23.
//

import SwiftUI
import AVKit

// MARK: - properties


//MARK: - body
struct VideoPlayerView: View {
    var videoSelected: String
    var videoTitle: String
    
    var body: some View {
        VStack {
            VideoPlayer(player : playVideo(fileName: videoSelected, fileFormat: "mp4")) {
                
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal)
                , alignment: .topLeading
            )
        }
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}


//MARK: - preview
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
        //            .previewLayout(.sizeThatFits)
        //            .padding()
    }
}
