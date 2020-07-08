//
//  UserListView.swift
//  CoreDataAndSwiftUI
//
//  Created by 神村亮佑 on 2020/07/08.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI

struct UserListView: View {
    
    
    @ObservedObject var model: UserListViewModel
    
    //初期化
    init(){
        self.model = UserListViewModel()
    }
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(self.model.users){ user in
                    NavigationLink(destination: UserRegisterView(user)){
                        UserListRow(user)
                    }
                }
                .onDelete(perform: self.model.onDeleteRows(offsets: ))
            }
            
        }.navigationBarTitle(Text("ユーザーリスト"), displayMode: .inline)
        .navigationBarItems(trailing: NavigationLink (destination: UserRegisterViewModel(), label: {
            Image(systemName: "person.badge.plus")
                .font(.system(size: 20))
                .foregroundColor(.blue)
        }))
            .onAppear(perform: self.model.onApper)
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
