//
//  ContentView.swift
//  Youtube UI
//
//  Created by Roma Marshall on 26.02.21.
//

import SwiftUI

struct ContentView: View {
    let logoWidth: CGFloat = UIScreen.main.bounds.size.width / 4 // Screen width
    let resolutionLogo: CGFloat = 100 / 56 // Logo resolution
    
    var body: some View {
        let logoHeight: CGFloat = logoWidth / resolutionLogo
        VStack {
            HStack {
                Image("youtube")
                    .resizable()
                    .frame(width: logoWidth, height: logoHeight)
                    .padding(.horizontal)
                
                Spacer()
                
                HStack(spacing: 15) {
                    Text("📺")
                    Text("🔔")
                    Text("🔍")
                    Text("👨")
                }
                .font(.title2)
                .padding(.horizontal)
            }
            .padding(.vertical, -10)
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(youtubeData) { item in
                    LoopView(youtube: item)
                }
            }
            
            Divider()
                .padding(.top, -10)
            
            HStack(spacing: 40) {
                Text("Home")
                    .font(.system(size: 12))
                    .overlay(
                        Text("🏠")
                            .font(.title)
                            .padding(.top, -41)
                    )
                    .padding(.top, 30)
                Text("Navigator")
                    .font(.system(size: 12))
                    .overlay(
                        Text("🧭")
                            .font(.title)
                            .padding(.top, -41)
                    )
                    .padding(.top, 30)
                Text("+")
                    .fontWeight(.light)
                    .font(.system(size: 30))
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.black)
                            .frame(width: 50, height: 50)
                    )
                Text("Subscriptions")
                    .font(.system(size: 12))
                    .overlay(
                        Text("🗂")
                            .font(.title)
                            .padding(.top, -41)
                    )
                    .padding(.top, 30)
                Text("Library")
                    .font(.system(size: 12))
                    .overlay(
                        Text("⏯")
                            .font(.title)
                            .padding(.top, -41)
                    )
                    .padding(.top, 30)
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LoopView: View {
    var youtube: Youtube
    let resolutionPreview: CGFloat = 720 / 404 //Preview resolution
    
    var body: some View {
        let previewWidth: CGFloat = UIScreen.main.bounds.size.width
        let previewHight: CGFloat = previewWidth / resolutionPreview
        
        //        Image("preview1")
        youtube.preview
            .resizable()
            .frame(width: previewWidth, height: previewHight)
        HStack(alignment: .top) {
            //            Image("preview1")
            youtube.preview
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(30)
                .padding(.horizontal, 3)
            VStack(alignment: .leading) {
                Text(youtube.title)
                Text(youtube.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text("...")
                .rotationEffect(.degrees(-90))
                .padding(.trailing, 10)
        }
        
        Spacer()
        
    }
}

struct Youtube: Identifiable {
    var id = UUID()
    var preview: Image
    var title: String
    var description: String
}

let youtubeData = [
    Youtube(preview: Image("preview1"), title: "lofi hip hop radio - beats to relax/study to", description: "ChilledCoew - 47k views - 2 years ago"),
    Youtube(preview: Image("preview2"), title: "2 A.M Study Session 📚 - [lofi hip hop/chill beats]  ", description: "ChilledCoew - 9.4M views - 10 months ago"),
    Youtube(preview: Image("preview3"), title: "1 A.M Study Session 📚 - [lofi hip hop/chill beats]", description: "ChilledCoew - 38M views - 1 year ago"),
    Youtube(preview: Image("preview4"), title: "3 A.M Study Session 📚 - [lofi hip hop/chill beats]  ", description: "ChilledCoew - 5.6M views - 5 months ago"),
    
]
