//
//  ContentView.swift
//  CoverFlow
//
//  Created by Hariz Shirazi on 2023-03-10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(TestingLibrary) { album in
                    VStack {
                        GeometryReader { geo in
                            VStack {
                                Image(album.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150.0, height: 150.0)
                                Text(album.name)
                                    .fontWeight(.bold)
                                Text(album.artist)
                            }
                                .padding()
                                .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).midX) / 16), axis: (x: 0, y: 1, z: 0))
                                .frame(width: 300, height: 300)
                        }
                        .frame(width: 300, height: 300)
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
