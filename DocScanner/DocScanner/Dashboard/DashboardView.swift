//
//  ContentView.swift
//  DocScanner
//
//  Created by Vladimir Stasenko on 14.01.2023.
//

import SwiftUI

struct DashboardView: View {
    @StateObject private var vm = DashboardViewModel()

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 20)

            Text("DocScanner")
                .font(.title)
                .bold()

            Spacer()
                .frame(height: 30)

//            ScrollView(.horizontal) {
                Grid(horizontalSpacing: 10, verticalSpacing: 10) {
                    ForEach(0..<5) { row in
                        GridRow {
                            ForEach(0..<5) { column in
                                Button(action: {}) {
                                    Image(systemName: "heart.fill")
                                        .tint(Color.red)
                                        .frame(width: 50, height: 50)
                                }
                                .background(Color.green.opacity(0.25))
                            }
                        }
                    }
                }
//                .background(Color.purple.opacity(0.25))
//            }
//            .background(Color.gray.opacity(0.25))

            Spacer()

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
                    // TODO: show user's gallery
                } label: {
                    Text("Gallery")
                        .font(.title2)
                }
            }
//            .background(Color.green.opacity(0.25))

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
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
