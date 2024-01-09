//
//  GridItemDropDelegate.swift
//  DragAndDrop
//
//  Created by Tsuruta, Hiromu | Tsuru | ECID on 2024/01/09.
//

import SwiftUI
import UniformTypeIdentifiers

// MARK: - DropDelegate
struct GridItemDropDelegate: DropDelegate {
    var dropEntered: () -> Void
    var dropUpdated: () -> DropProposal?
    var performDrop: () -> Bool

    func dropEntered(info: DropInfo) {
        dropEntered()
    }

    func dropUpdated(info: DropInfo) -> DropProposal? {
        dropUpdated()
    }

    func performDrop(info: DropInfo) -> Bool {
        performDrop()
    }
}
