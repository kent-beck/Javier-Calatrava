//
//  DataManagerUT.swift
//  SeatCodeTests
//
//  Created by Javier Calatrava on 19/7/22.
//
@testable import SeatCode
import XCTest

class DataManagerUT: XCTestCase {

    var sut: DataManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = DataManager()
    }

    func testFetchTripsWithMock() async throws {
        // Given
        let apiManagerMock = APIManagerMock()
        sut = DataManager(apiManager: apiManagerMock)
        
        let expectation = expectation(description: "fetchTrips")
        // When
        let result = await sut.fetchTrips()
        switch result {
        case .success( _):
            // Then
            XCTAssertEqual(apiManagerMock.fetchTripsCounter, 1)
        default:
            XCTFail("Unexpected response")
        }
        expectation.fulfill()
        await waitForExpectations(timeout: 1)
    }
    
    func testFetchTrips() async throws {

        let expectation = expectation(description: "fetchTrips")
        // When
        let result = await sut.fetchTrips()
        switch result {
        case .success(let trips):
            // Then
            XCTAssertEqual(trips.count, 7)
            XCTAssertEqual(trips[3].destination.address.isEmpty, false)
            XCTAssertEqual(trips[3].origin.address.isEmpty, false)
            XCTAssertEqual(trips[3].status, "scheduled")
            XCTAssertEqual(trips[3].origin.address.isEmpty, false)
            XCTAssertEqual(trips[3].origin.point.latitude > 0, true)
            XCTAssertEqual(trips[3].polylineStr.isEmpty, false)
            XCTAssertNil(trips[3].stopPoints[0].id)
            XCTAssertEqual(trips[3].stopPoints[1].id, 9)
            XCTAssertEqual(trips[3].stopPoints[2].id, 10)
            XCTAssertNil(trips[3].stopPoints[3].id)
        default:
            XCTFail("Unexpected response")
        }
        expectation.fulfill()
        await waitForExpectations(timeout: 1)
    }

}
