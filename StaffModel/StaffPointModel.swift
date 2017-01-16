//
//  StaffPointModel.swift
//  StaffModel
//
//  Created by James Bean on 1/15/17.
//
//

import PlotModel
import PitchSpellingTools

/// A single point on a `Staff`.
public struct StaffPointModel {
    
    /// A `Set` of `StaffRepresentablePitch` values.
    public let elements: Set<StaffRepresentablePitch>
    
    // MARK: - Initializers
    
    /// Create a `StaffPointModel` with any type of `Sequence` containing 
    /// `StaffRepresentablePitch` values.
    public init <S: Sequence> (_ sequence: S)
        where S.Iterator.Element == StaffRepresentablePitch
    {
        self.elements = Set(sequence)
    }
    
    /// - returns: Ledger lines above and below
    public func ledgerLines(_ clef: Clef) -> (above: Int, below: Int) {
        return (ledgerLinesAbove(clef), ledgerLinesBelow(clef))
    }
    
    private func ledgerLinesAbove(_ clef: Clef) -> Int {
        guard let highest = elements.max()?.spelledPitch else { return 0 }
        return ledgerLinesAmount(distance: clef.coordinate(highest) - 6)
    }
    
    private func ledgerLinesBelow(_ clef: Clef) -> Int {
        guard let lowest = elements.min()?.spelledPitch else { return 0 }
        return ledgerLinesAmount(distance: abs(clef.coordinate(lowest)) - 6)
    }
    
    private func ledgerLinesAmount(distance: Int) -> Int {
        return distance >= 0 ? distance / 2 + 1 : 0
    }

}
