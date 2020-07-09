//
//  TMDBTests.swift
//  TMDBTests
//
//  Created by Cristian Kocza on 30/06/2020.
//

import XCTest
@testable import TMDB

extension Optional {
    enum Error: Swift.Error {
        case foundNil
    }
    
    func tryUnwrap() throws -> Wrapped {
        guard let result = self else { throw Error.foundNil }
        return result
    }
}

class TMDBTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
   
    func test_getConfiguration_expectedPath() throws {
        let api = API(apiKey: "abc")
        let url = try XCTUnwrap(api.getConfiguration().urlRequest.url)
        XCTAssertEqual(url.path, "/3/configuration")
    }

}
