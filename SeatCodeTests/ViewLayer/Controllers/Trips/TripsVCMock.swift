//
//  TripsVCMock.swift
//  SeatCodeTests
//
//  Created by Javier Calatrava on 19/7/22.
//
@testable import SeatCode
import Foundation

internal final class TripsVCMock: TripsVCProtocol {
    
    var presentActivityIndicatorCounter = 0
    var removeActivityIndicatorCounter = 0
    var presentCounter = 0
    var presentFetchedTripsCounter = 0
    
    func presentActivityIndicator() {
        presentActivityIndicatorCounter += 1
    }
    
    func removeActivityIndicator() {
        removeActivityIndicatorCounter += 1
    }
    
    func present(error: Error) {
        presentCounter += 1
    }
    
    func presentFetchedTrips(tripsVM: [TripVM]) {
        presentFetchedTripsCounter += 1
    }
}