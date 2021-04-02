//
//  ProviderListView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/1/21.
//

import SwiftUI


struct ProviderListView: View {
    @EnvironmentObject var viewModel: AuthModel
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach(0..<20) { _ in
                        ListCell()
                    }
                }
                .padding()
            }
            Button(action: {
                viewModel.signOut()
            }, label: {
                Image(systemName: "arrowshape.turn.up.left")
                    .resizable()
                    .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//            .padding()
        }
    }
}

struct ProviderListView_Previews: PreviewProvider {
    static var previews: some View {
        ProviderListView()
    }
}
