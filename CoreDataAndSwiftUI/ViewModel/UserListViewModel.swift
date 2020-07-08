//
//  UserListViewModel.swift
//  CoreDataAndSwiftUI
//
//  Created by 神村亮佑 on 2020/07/08.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI

class UserListViewModel: ObservableObject{
    
    @Published var users: [User]
    
    //初期化
    init() {
        self.users = []
    }
    
    //データ全件取得
    func fetchAll() {
        users = CoreDataModel.allUsers()
    }
    
    //表示イベント
    func onApper(){
        fetchAll()
    }
    
    func onDeleteRows(offsets: IndexSet){
        offsets.forEach{ index in
            CoreDataModel.delete(users[index])
        }
        CoreDataModel.save()
        
        users.remove(atOffsets: offsets)
    }
    
}
