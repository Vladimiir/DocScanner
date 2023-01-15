//
//  SelectedPhotoView.swift
//  DocScanner
//
//  Created by Vladimir Stasenko on 15.01.2023.
//

import Foundation
import SwiftUI

struct SelectedPhotoView: View {
    @ObservedObject var vm: SelectedPhotoViewModel

    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 20)

            Image(uiImage: vm.image)
                .resizable()
                .scaledToFit()

            Spacer()
                .frame(height: 20)

            Text("SelectedPhotoView\nSelectedPhotoView\nSelectedPhotoView\n SelectedPhotoView\nSelectedPhotoView\nSelectedPhotoView\n")
        }
    }
}
