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
    @Binding var user: User?
    @ObservedObject var viewObj = SearchViewModel()

    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()

            VStack(alignment: .leading) {
                ForEach(searchText.isEmpty ? viewObj.providers : viewObj.filteredProviders(searchText)) { provider in
                    HStack { Spacer()}
                    Button(action: {
                        show.toggle()
                        startChar.toggle()
                        user = provider
                    }, label: {
                       UserCell(provider: provider)
                    })
                }
            }
            .padding(.leading)
        }
    }
}

//struct NewMessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewMessageView(show: .constant(true), startChar: .constant(true))
//    }
//}
