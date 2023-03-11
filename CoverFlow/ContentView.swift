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
                            let minx = -Double(geo.frame(in: .global).minX)
                            let maxx = -Double(geo.frame(in: .global).minX)
                            let arr = [minx, maxx]
                            let middlex = calculateMedian(array: arr)
                            VStack {
                                Image(album.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100.0, height: 100.0)
                                Text(album.name)
                                    .fontWeight(.bold)
                                Text(album.artist)
                            }
                                .padding()
                                .rotation3DEffect(.degrees(middlex / 8), axis: (x: 0, y: 1, z: 0))
                                .frame(width: 200, height: 200)
                        }
                        .frame(width: 200, height: 200)
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
