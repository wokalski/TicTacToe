//
//  Rules.swift
//  TicTacToe
//
//  Created by Maarten Schumacher on 12/19/15.
//  Copyright © 2015 Maarten Schumacher. All rights reserved.
//

import Foundation

struct Rule {
    let analysis: GridLineAnalysis
    let priority: (Player) -> (Priority)
}

func ruleMatching(analysis analysis: GridLineAnalysis) -> Rule? {
    return rules
        .filter { $0.analysis == analysis }
        .first
}

let rules: [Rule] = [
    
    Rule(
        analysis: GridLineAnalysis(
            empties: 1,
            circles: 2,
            crosses: 0
        ),
        priority: { (player: Player) -> Priority in
            return player.returnIf(circle: .Highest, cross: .High)
        }
    ),
    
    Rule(
        analysis: GridLineAnalysis(
            empties: 1,
            circles: 0,
            crosses: 2
        ),
        priority: { (player: Player) -> Priority in
            return player.returnIf(circle: .High, cross: .Highest)
        }
    ),
    
    Rule(
        analysis: GridLineAnalysis(
            empties: 1,
            circles: 1,
            crosses: 1
        ),
        priority: { _ in .Lowest }
    )
    
]