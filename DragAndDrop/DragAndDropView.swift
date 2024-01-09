//
//  DragAndDropView.swift
//  DragAndDrop
//
//  Created by Tsuruta, Hiromu | Tsuru | ECID on 2024/01/06.
//

import SwiftUI
import UniformTypeIdentifiers

//MARK: - View
struct DragAndDropView: View {
    @ObservedObject private var model = GridModel()

    var body: some View {
        VStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: [.init(.flexible())], spacing: 5) {
                    ForEach(model.data) { data in
                        GridItemView(data: data)
                            .opacity(model.draggingData?.id == data.id ? 0 : 1)
                            .onDrag { model.didDragItem(data) }
                            .onDrop(of: [UTType.text], delegate: GridItemDropDelegate(
                                dropEntered: { model.didDropEntered(data) },
                                dropUpdated: { model.didDropUpdated() },
                                performDrop: { model.didPerformDrop() }
                        ))
                    }
                }.animation(.default, value: model.data)
            }
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity)
    }
}
