//
//  UserRegisterView.swift
//  CoreDataAndSwiftUI
//
//  Created by 神村亮佑 on 2020/07/08.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI

struct UserRegisterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    //ViewModel
    @ObservedObject var model: UserRegisterViewModel
    
    //初期化
    init(_ user: User? = nil){
        self.model = UserRegisterViewModel(user)
    }
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Spacer()
                .frame(height: 16)
            
            Toggle(isOn: self.model.$user.admin){
                Text("管理者権限")
            }
            
            TextField("表示名", text: self.model.$user.nickname)
            TextField("ユーザーID", text: self.model.$user.userId)
            SecureField("パスワード", text: self.model.$user.password)
            SecureField("パスワード　確認用", text: self.$model.password2)
            
            Spacer()
        }
        .padding([.leading, .trailing], 16)
        .navigationBarTitle(Text(self.model.title), displayMode: .inline)
        .navigationBarItems(leading: Button(action: {
            //登録・編集キャンセル
            self.model.cancel()
            
            //画面を閉じる
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Calcel")
                .foregroundColor(.blue)
        }),trailing: Button(action: {
            //保存
            self.model.save()
            
            if self.model.validationError == .none{
                self.presentationMode.wrappedValue.dismiss()
            }
        }, label: {
            Text("Save")
                .foregroundColor(.blue)
        }))
            .alert(isPresented: self.$model.isPresentedAlert){
                Alert(title: Text("確認"), message: Text(self.model.errorMdessage))
        }
    }
}

struct UserRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        UserRegisterView()
    }
}
