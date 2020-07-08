//
//  UserListRow.swift
//  CoreDataAndSwiftUI
//
//  Created by 神村亮佑 on 2020/07/08.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI

struct UserListRow: View {
    
    //ユーザー情報
    @ObservedObject var user: User
    
    //初期化
    init(_ user: User){
        self.user = user
    }
    var body: some View {
        HStack(alignment: .center, spacing: 0){
            VStack(alignment: .leading, spacing: 0){
                
                //表示名
                Text(self.user.nickname)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                
                Text(self.user.userId)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            //管理者権限マーク
            if self.user.admin{
                Image(systemName: "checkmark.seal")
                    .font(.system(size:20))
                    .foregroundColor(.green)
            }
        
        }
        .padding(.trailing, 8)
            
            
            
            
            
            
        
        
    }
}

struct UserListRow_Previews: PreviewProvider {
    static var previews: some View {
        UserListRow()
    }
}
