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

            Text(vm.recognizedText)
                .frame(maxWidth: .infinity)
                .padding(.top, 10)
                .background(Color.gray.opacity(0.25))
        }
        .onAppear {
            vm.onAppearAction()
        }
    }
}

struct SelectedPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedPhotoView(vm: SelectedPhotoViewModel(UIImage()))
    }
}
