//
//  ToggleUserType.swift
//  WeProvide
//
//  Created by Mihir Khetale on 5/7/21.
//

import SwiftUI

struct ToggleUserType: View {
    @EnvironmentObject var viewModel: AuthModel
    var body: some View {
        if viewModel.userType == "user" {
            UserHome()
//            Text("testing2")
        } else {
            ProviderHome()
        }
        
    }
}

struct ToggleUserType_Previews: PreviewProvider {
    static var previews: some View {
        ToggleUserType()
    }
}
