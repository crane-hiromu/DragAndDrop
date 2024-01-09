//
//  GridItemProvider.swift
//  DragAndDrop
//
//  Created by Tsuruta, Hiromu | Tsuru | ECID on 2024/01/09.
//

import Foundation

// MARK: - ItemProvider
final class GridItemProvider: NSItemProvider {
    var deinitialize: (() -> Void)?

    deinit {
        deinitialize?()
    }
}
