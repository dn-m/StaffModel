//
//  StaffPointModelTests.swift
//  StaffModel
//
//  Created by James Bean on 1/16/17.
//
//

import XCTest
import Pitch
import PitchSpellingTools
import StaffModel

private func == <T: Equatable> (_ a: (T, T), _ b: (T, T)) -> Bool {
    return a.0 == b.0 && a.1 == b.1
}

class StaffPointModelTests: XCTestCase {

    let treble = Clef(.treble)
    let bass = Clef(.bass)
    
    func staffPoint(_ pitchSet: PitchSet) -> StaffPointModel {
        let spelled = pitchSet.map { try! $0.spelledWithDefaultSpelling() }
        let representable = spelled.map { StaffRepresentablePitch($0) }
        return StaffPointModel(representable)
    }
    
    func testInit() {
        let pitchSet: PitchSet = [60,61,62,63]
        let spelled = pitchSet.map { try! $0.spelledWithDefaultSpelling() }
        let representable = spelled.map { StaffRepresentablePitch($0) }
        _ = StaffPointModel(representable)
    }
    
    func testLedgerLinesAboveAndBelowEmpty() {
        let staffPoint = StaffPointModel([])
        XCTAssertEqual(staffPoint.ledgerLines(treble).0, 0)
    }
    
    func testLedgerLinesAboveMonadInStaff() {
        let point = staffPoint([71])
        XCTAssertEqual(point.ledgerLines(treble).0, 0)
    }
    
    func testLedgerLinesBelowMonadInStaff() {
        
        let point = staffPoint([48])
        XCTAssertEqual(point.ledgerLines(bass).1, 0)
    }
    
    func testLedgerLinesAboveMonadJustAboveNoLedgerLines() {
        
        let point = staffPoint([79])
        XCTAssertEqual(point.ledgerLines(treble).1, 0)
    }
    
    func testLedgerLinesBelowMonadJustBelowNoLedgerLines() {
        
        let point = staffPoint([41])
        XCTAssertEqual(point.ledgerLines(bass).1, 0)
    }
    
    func testLedgerLinesMonadOneAbove() {
        let point = staffPoint([60])
        XCTAssertEqual(point.ledgerLines(bass).0, 1)
    }
    
    func testLedgerLinesMonadOneBelow() {
        let point = staffPoint([60])
        XCTAssertEqual(point.ledgerLines(treble).1, 1)
    }
    
    func testLedgerLinesDyadSingleAboveAndBelow() {
        let point = staffPoint([60, 81])
        XCTAssertEqual(point.ledgerLines(treble).1, 1)
        XCTAssertEqual(point.ledgerLines(treble).0, 1)
    }
    
    func testManyPitchesOnlySeveralLinesAboveDNatural() {
        let point = staffPoint([64,66,67,69,86])
        XCTAssertEqual(point.ledgerLines(treble).1, 0)
        XCTAssertEqual(point.ledgerLines(treble).0, 2)
    }
}
