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
            ScrollView(.horizontal) {
                
            }
            .background(Color.gray.opacity(0.25))

            HStack {
                Button {
                    // TODO: call Vision
                } label: {
                    Text("Scan")
                }

                Spacer()
                    .frame(width: 50)

                Button {
                    // TODO: show user's gallery
                } label: {
                    Text("Gallery")
                }
            }
            .frame(height: 150)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
