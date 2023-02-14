//
//  PlayoVMTest.swift
//  Playo_AssignmentTests
//
//  Created by Jamal Ahamad on 05/09/22.
//

import XCTest
@testable import Playo_Assignment

class PlayoVMTest: XCTestCase {
    var vm: NewsViewModel?
    override func setUpWithError() throws {
        vm = NewsViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

       override func tearDownWithError() throws {
           // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testVm() {
      let exp = expectation(description: "test")
        vm?.getNewsData(url: Constants.newsUrl, completion: { (articleModel, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(articleModel)
            exp.fulfill()
        })
        self.waitForExpectations(timeout: 100, handler: nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
