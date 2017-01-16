//
//  Accidental.swift
//  StaffModel
//
//  Created by James Bean on 1/15/17.
//
//

import PitchSpellingTools

public enum Accidental {
    
    case natural
    case naturalUp
    case naturalDown
    case sharp
    case sharpUp
    case sharpDown
    case flat
    case flatUp
    case flatDown
    case quarterSharp
    case quarterSharpUp
    case quarterSharpDown
    case quarterFlat
    case quarterFlatUp
    case quarterFlatDown

    public init?(spelling: PitchSpelling) {
        self.init(coarse: spelling.quarterStep.rawValue, fine: spelling.eighthStep.rawValue)
    }
    
    public init?(coarse: Float, fine: Float) {
        switch (coarse, fine) {
        case (+0.0, +0.00): self = .natural
        case (+0.0, +0.25): self = .naturalUp
        case (+0.0, -0.25): self = .naturalDown
        case (+1.0, +0.00): self = .sharp
        case (+1.0, +0.25): self = .sharpUp
        case (+1.0, -0.25): self = .sharpDown
        case (-1.0, +0.00): self = .flat
        case (-1.0, +0.25): self = .flatUp
        case (-1.0, -0.25): self = .flatDown
        case (+0.5, +0.00): self = .quarterSharp
        case (+0.5, +0.25): self = .quarterSharpUp
        case (+0.5, -0.25): self = .quarterSharpDown
        case (-0.5, +0.00): self = .quarterFlat
        case (-0.5, +0.25): self = .quarterFlatUp
        case (-0.5, -0.25): self = .quarterFlatDown
        default: return nil
        }
    }
}
