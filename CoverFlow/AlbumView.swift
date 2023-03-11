//
//  AlbumView.swift
//  CoverFlow
//
//  Created by Hariz Shirazi on 2023-03-10.
//

import SwiftUI

struct AlbumView: View {
    public var album: Album
    @State var opened = false
    var body: some View {
        if opened {
            ZStack {
                //Color.gray
                    //.ignoresSafeArea()
                VStack {
                    HStack {
                        Button(action: {opened.toggle()}, label: {Label("", systemImage: "chevron.left")})
                            .buttonStyle(PlainButtonStyle())
                        HStack {
                            Spacer()
                            VStack {
                                Text(album.name)
                                    .font(.system(.headline))
                                Text(album.artist)
                                    .font(.system(.footnote))
                            }
                            Spacer()
                        }
                    }
                    List {
                        ForEach(album.songs) {song in
                            HStack {
                                Text(String((album.songs.firstIndex(of: song)!) + 1))
                                VStack(alignment: .leading) {
                                    Text(song.name)
                                        .multilineTextAlignment(.center)
                                    Text(song.artist)
                                        .font(.system(.footnote))
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                    }
                }
                .background(.gray)
            }
            .padding()
        } else {
            VStack {
                Image(album.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: itemWidth / 2, height: itemWidth / 2)
                Text(album.name)
                    .fontWeight(.bold)
                Text(album.artist)
            }
            .onTapGesture {
                print("switching")
                opened.toggle()
            }
        }
    }
}

//struct AlbumView_Previews: PreviewProvider {
//    static var previews: some View {
//        AlbumView()
//    }
//}
