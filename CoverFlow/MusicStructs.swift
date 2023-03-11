//
//  Album.swift
//  CoverFlow
//
//  Created by Hariz Shirazi on 2023-03-10.
//

import Foundation

// this is going to be useless once i bring it to ipod, just for testing purposes
public struct Album: Identifiable {
    public var id = UUID()
    var image: String
    var name: String
    var artist: String
    var songs: [Song]
}

public struct Song: Identifiable {
    public var id = UUID()
    var name: String
    var artist: String
}
