//
//  GridItemView.swift
//  DragAndDrop
//
//  Created by Tsuruta, Hiromu | Tsuru | ECID on 2024/01/09.
//

import SwiftUI

//MARK: - GridItem
struct GridItemView: View {
    var data: GridData

    var body: some View {
        VStack {
            Text(String(data.id))
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 44)

        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        .background(.green)
    }
}
