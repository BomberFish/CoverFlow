//
//  AlbumView.swift
//  CoverFlow
//
//  Created by Hariz Shirazi on 2023-03-10.
//

import SwiftUI

struct AlbumView: View {
    public var album: Album
    var body: some View {
        VStack {
            Image(album.image)
                .resizable()
                .scaledToFit()
                .frame(width: itemWidth / 2, height: itemWidth / 2)
            Text(album.name)
                .fontWeight(.bold)
            Text(album.artist)
        }
    }
}

//struct AlbumView_Previews: PreviewProvider {
//    static var previews: some View {
//        AlbumView()
//    }
//}
