//
//  ContentView.swift
//  DocScanner
//
//  Created by Vladimir Stasenko on 14.01.2023.
//

import SwiftUI
import PhotosUI

struct DashboardView: View {
    @StateObject private var vm = DashboardViewModel()
    private var rows = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 20)

            Text("DocScanner")
                .font(.title)
                .bold()

            Spacer()
                .frame(height: 30)

            ScrollView {
                LazyVGrid(columns: rows) {
                    ForEach(vm.selectedPhotosData, id: \.self) { photoData in
                        if let image = UIImage(data: photoData) {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
                .background(Color.gray.opacity(0.25))
            }

            Spacer()
                .frame(maxHeight: 30)

            HStack {
                Button {
                    vm.isScannerPresented.toggle()
                } label: {
                    Text("Scan")
                        .font(.title2)
                }

                Spacer()
                    .frame(width: 50)

                Button {
                    vm.isGalleryPresented.toggle()
                } label: {
                    Text("Gallery")
                        .font(.title2)
                }
            }

            Spacer()
                .frame(height: 50)
        }
        .fullScreenCover(isPresented: $vm.isScannerPresented) {
            CameraView(cancelAction: {
                vm.isScannerPresented.toggle()
            }, resultAction: { result in
                switch result {
                case .success(let scan):
                    print("\(scan)")
                case .failure(let error):
                    print("\(error)")
                }

                vm.isScannerPresented.toggle()
            })
        }
        .sheet(isPresented: $vm.isGalleryPresented) {
            PhotosPicker(selection: $vm.selectedImages,
                         matching: .images,
                         photoLibrary: .shared()) {
                Text("Select Multiple Photos")
            }
            .onChange(of: vm.selectedImages) { newItems in
                for newItem in newItems {
                    Task {
                        if let data = try? await newItem.loadTransferable(type: Data.self) {
                            vm.selectedPhotosData.append(data)
                        }
                    }
                }
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
