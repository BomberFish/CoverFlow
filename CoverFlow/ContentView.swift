//
//  ContentView.swift
//  CoverFlow
//
//  Created by Hariz Shirazi on 2023-03-10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let itemWidth = 300.0
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(TestingLibrary) { album in
                    VStack {
                        GeometryReader { geo in
                            VStack {
                                Image(album.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: itemWidth / 2, height: itemWidth / 2)
                                Text(album.name)
                                    .fontWeight(.bold)
                                Text(album.artist)
                            }
                                .padding()
                                .rotation3DEffect(.degrees((-Double(geo.frame(in: .global).minX) / 8) + itemWidth / 8), axis: (x: 0, y: 1, z: 0))
                                .frame(width: itemWidth, height: itemWidth)
                        }
                        .frame(width: itemWidth, height: itemWidth)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
