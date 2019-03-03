//
//  Viper_SampleTests.swift
//  Viper-SampleTests
//
//  Created by 손창우 on 26/02/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import XCTest
import RxSwift
@testable import Viper_Sample

class Viper_SampleTests: XCTestCase {

    var interactor: RxMainInteractor!
    let disposeBag = DisposeBag()
    override func setUp() {
        super.setUp()
        interactor = RxMainInteractor()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        super.tearDown()
        interactor = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        interactor.fetchDatas()
            .subscribe(onSuccess: { result in
                switch result {
                case .success(let value):
                    XCTAssert(value.count == MainEntity.allCases.count)
                case .failure:
                    XCTAssert(false)
                }
            }) { error in
                XCTAssert(false)
        }.disposed(by: disposeBag)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
