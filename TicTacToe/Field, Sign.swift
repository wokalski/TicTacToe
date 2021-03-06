//
//  Sign.swift
//  TicTacToe
//
//  Created by Maarten Schumacher on 12/13/15.
//  Copyright © 2015 Maarten Schumacher. All rights reserved.
//

import Foundation

struct Field<T> {
    let element: T
    let point: Point
}

enum Sign {
    case Empty
    case Cross
    case Circle
    
    func returnIf<T>(empty empty: T, cross: T, circle: T) -> T {
        switch self {
        case .Empty: return empty
        case .Cross: return cross
        case .Circle: return circle
        }
    }
    
    var description: String {
        return returnIf(empty: "...", cross: "Cross", circle: "Circle")
    }
}