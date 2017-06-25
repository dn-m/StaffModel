//
//  StaffModel.swift
//  StaffModel
//
//  Created by James Bean on 1/15/17.
//
//

import Collections
import PitchSpellingTools
import PlotModel
//
///// - TODO: Inject transposition as instance property. 
//public struct StaffModel: PlotModel {
//    
//    public typealias VerticalCoordinate = StaffSlot
//    public typealias HorizontalCoordinate = Double
//    
//    public typealias Entity = SpelledPitch
//    
//    /// Determines the way that information is mapped onto the horizontal axis.
//    public var horizontalAxis: Clef
//    
//    /// Determines the way that information is mapped onto the vertical axis.
//    public var verticalAxis: Clef
//    
//    /// TODO: Handle multiple voices within single staff point
//    /// - Either, multiple points
//    /// - Or, a point handles multiple voices (or [Set<...>])
//    var points: [Double: [StaffPointModel]] = [:]
//
//    public init(clef: Clef = Clef(.treble)) {
//        self.verticalAxis = clef
//        
//        // FIXME: Make linear axis
//        self.horizontalAxis = clef
//    }
//    
//    public mutating func addPoint(_ point: StaffPointModel, at position: Double) {
//        points.safelyAppend(point, toArrayWith: position)
//    }
//}

//
//extension StaffModel: AnyCollectionWrapping {
//    
//    // MARK: - `AnyCollectionWrapping`
//    
//    public var collection: AnyCollection<(key: Double, value: [StaffPointModel])> {
//        return AnyCollection(points)
//    }
//}
