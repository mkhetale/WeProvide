//
//  ProviderSearchView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/5/21.
//

import SwiftUI

struct ProviderSearchView: View {
    @State var searchText = ""
//    @ObservedObject var profileObj: ProfileViewModel
    @ObservedObject var viewObj = SearchViewModel()

    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()

            VStack(alignment: .leading) {
                ForEach(viewObj.providers) { provider in
                    NavigationLink(
                        destination: UserChatView(user: provider),
                        label: {
                            UserCell(provider: provider)
                        })
//                    HStack { Spacer()}
//                    Button(action: {
////                        show.toggle()
////                        startChar.toggle()
//                    }, label: {
//                       UserCell(provider: provider)
//                    })
//                    UserCell(provider: provider)
                }
            }
//            .padding(.leading)
        }
    }
}

//struct ProviderSearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProviderSearchView()
//    }
//}
