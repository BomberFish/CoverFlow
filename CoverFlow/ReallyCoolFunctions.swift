//
//  ReallyCoolFunctions.swift
//  CoverFlow
//
//  Created by Hariz Shirazi on 2023-03-10.
//

import Foundation

func calculateMedian(array: [Double]) -> Double {
    let sorted = array.sorted()
    if sorted.count % 2 == 0 {
        return Double((sorted[(sorted.count / 2)] + sorted[(sorted.count / 2) - 1])) / 2
    } else {
        return Double(sorted[(sorted.count - 1) / 2])
    }
}
