//
//  GridModel.swift
//  DragAndDrop
//
//  Created by Tsuruta, Hiromu | Tsuru | ECID on 2024/01/09.
//

import Foundation
import SwiftUI

//MARK: - Model
final class GridModel: ObservableObject {
    @Published private(set) var data = (1...20).map { GridData(id: "\($0)") }
    @Published private(set) var draggingData: GridData?
    private var draggingTimer: Timer?

    func didDragItem(_ item: GridData) -> NSItemProvider {
        draggingData = item
        setTimer()

        let object = String(item.id) as NSString
        let provider = GridItemProvider(object: object)
        provider.deinitialize = { [weak self] in
            DispatchQueue.main.async {
                self?.resetDropState()
            }
        }
        return provider
    }

    func didDropEntered(_ item: GridData) {
        guard
            let draggingData, item != draggingData,
            let from = data.firstIndex(of: draggingData),
            let to = data.firstIndex(of: item),
            data[to].id != draggingData.id else { return }

        let current = IndexSet(integer: from)
        let next = from < to ? to + 1 : to
        data.move(fromOffsets: current, toOffset: next)

        draggingTimer?.invalidate()
    }

    func didDropUpdated() -> DropProposal? {
        .init(operation: .move)
    }

    func didPerformDrop() -> Bool {
        resetDropState()
        return true
    }

    func resetDropState() {
        draggingData = nil
        draggingTimer?.invalidate()
    }

    func setTimer() {
        guard #unavailable(iOS 17.0) else { return }

        draggingTimer = .scheduledTimer(
            withTimeInterval: 1.5,
            repeats: true
        ) { [weak self] _ in
            self?.resetDropState()
        }
    }
}
