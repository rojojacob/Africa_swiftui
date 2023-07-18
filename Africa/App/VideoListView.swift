//
//  VideoListView.swift
//  Africa
//
//  Created by wac on 14/07/23.
//

import SwiftUI

struct VideoListView: View {
    
//MARK: - Properties
   @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    //MARK: - body
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem( placement: .navigationBarTrailing) {
                    Button(action: {
                       //shuffle videos
                        videos.shuffle()
                        //the vibration in the real device ...
                        hapticImpact.impactOccurred()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                    }
                }
            }
        }
    }


//MARK: - preview
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
