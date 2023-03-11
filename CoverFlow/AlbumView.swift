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
    @State var rotation = 0.0
    @State var animDuration = 0.5
    var body: some View {
        if opened {
            ZStack {
                //Color.gray
                    //.ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            rotation = -90.0
                            DispatchQueue.main.asyncAfter(deadline: .now() + animDuration) {
                                animDuration = 0.0
                                rotation = 90.0
                                animDuration = 0.5
                                opened.toggle()
                            }
                        }, label: {Label("", systemImage: "chevron.left")})
                            .buttonStyle(PlainButtonStyle())
                        HStack {
                            Spacer()
                            Spacer()
                            VStack {
                                Text(album.name)
                                    .font(.system(.headline))
                                    .multilineTextAlignment(.leading)
                                Text(album.artist)
                                    .font(.system(.footnote))
                                    .multilineTextAlignment(.leading)
                            }
                            .multilineTextAlignment(.leading)
                            Spacer()
                            Spacer()
                        }
                    }
                    List {
                        // FIXME: Everything's centered again
                        ForEach(album.songs) {song in
                            VStack {
                                HStack(alignment: .top) {
                                    Text(String((album.songs.firstIndex(of: song)!) + 1))
                                        .fontWeight(.heavy)
                                    VStack(alignment: .leading) {
                                        Text(song.name)
                                            .multilineTextAlignment(.leading)
                                        Text(song.artist)
                                            .font(.system(.footnote))
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                                .multilineTextAlignment(.leading)
                                Divider()
                            }
                            .multilineTextAlignment(.leading)
                        }
                    }
                    .listStyle(.plain)
                }
                .background(.gray)
            }
            .cornerRadius(10)
            .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
            .animation(.easeInOut(duration: animDuration), value: rotation)
            .padding()
            .onAppear {
                rotation = 0
            }
        } else {
            VStack {
                Image(album.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .frame(width: itemWidth * 0.5, height: itemWidth * 0.5)
                Text(album.name)
                    .fontWeight(.bold)
                Text(album.artist)
            }
            .cornerRadius(10)
            .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
            .animation(.easeInOut(duration: animDuration), value: rotation)
            .onTapGesture {
                print("switching")
                rotation = 90.0
                DispatchQueue.main.asyncAfter(deadline: .now() + animDuration) {
                    animDuration = 0.0
                    rotation = -90.0
                    animDuration = 0.5
                    opened.toggle()
                }
            }
            .onAppear {
                rotation = 0
            }
        }
    }
}

//struct AlbumView_Previews: PreviewProvider {
//    static var previews: some View {
//        AlbumView()
//    }
//}
