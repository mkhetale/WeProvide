//
//  NewMessageView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/22/21.
//

import SwiftUI

struct NewMessageView: View {
    @State var searchText = ""
    @Binding var show: Bool
    @Binding var startChar: Bool

    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()

            VStack(alignment: .leading) {
                ForEach(0..<19) { _ in
                    HStack { Spacer()}
                    Button(action: {
                        show.toggle()
                        startChar.toggle()
                    }, label: {
                       UserCell()
                    })
                }
            }
            .padding(.leading)
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(show: .constant(true), startChar: .constant(true))
    }
}
