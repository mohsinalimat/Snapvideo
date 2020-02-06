//
//  VideoEditorViewControllerTests.swift
//  SnapvideoTests
//
//  Created by Anastasia Petrova on 06/02/2020.
//  Copyright © 2020 Anastasia Petrova. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Snapvideo

class VideoEditorViewControllerTests: XCTestCase {
    func testVideoEditorViewController() {
        let filters = [AnyFilter(PassthroughFilter())]
        guard let path = Bundle.testBundle.path(forResource: "testVideo", ofType:"MOV") else {
            debugPrint("testVideo.MOV not found")
            return
        }
        let url = URL(fileURLWithPath: path)
        let vc = VideoEditorViewController(url: url, filters: filters) { (presentedFilter) in
        }

      assertSnapshot(matching: vc, as: .image)
    }
}
