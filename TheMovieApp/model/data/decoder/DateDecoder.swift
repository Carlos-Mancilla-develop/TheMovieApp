//
//  DateDecoder.swift
//  TheMovieApp
//
//  Created by Carlos Mancilla on 26-11-20.
//

import Foundation

final class DateDecoder: JSONDecoder {
    
    let dateFormatter = DateFormatter()
    
    override init() {
        super.init()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateDecodingStrategy = .formatted(dateFormatter)
    }
    
}
