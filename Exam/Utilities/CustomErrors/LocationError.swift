//
//  LocationError.swift
//  Exam
//
//  Created by Jade Lapuz on 6/09/21.
//

import Foundation

enum LocationError: Error {
    case noLocationFound
    case denied
    
    var localizedDescription: String {
        switch self {
        case .noLocationFound: return "No location found"
        case .denied: return "You did not allow permission to acces∂∂s your location, defaulting location to Philippines"
        }
    }
}
