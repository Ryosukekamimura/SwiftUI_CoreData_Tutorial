//
//  UserRegisterViewModel.swift
//  CoreDataAndSwiftUI
//
//  Created by 神村亮佑 on 2020/07/08.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI

class UserRegisterViewModel: ObservableObject{
    
    //入力チェックエラー
    enum ValidationError: String{
        case none = ""
        case emptyNickname = "表示名を入力してください"
        case emptyUserId = "ユーザーIDを入力してください"
        case emptyPassword = "パスワードを入力してください"
        case mismatchedPassword = "パスワードが一致しません。"
        
    }
    
    //ユーザー情報
    @ObservedObject var user: User
    
    //確認用パスワード
    @Published var password2: String = ""
    
    //アラートダイアログ表示フラグ
    @Published var isPresentedAlert: Bool = false
    
    
    //入力チェックエラー
    @Published var validationError: ValidationError = .none
    
    //編集モード判定
    private var isEditMode: Bool = false
    
    //画面タイトル
    var title: String {
        return isEditMode ? user.nickname : "新規ユーザー"
    }
    
    //エラーメッセージ
    var errorMdessage: String{
        return validationError.rawValue
    }
    
    //初期化
    init(_ user: User? = nil){
        if user == nil{
            self.user = CoreDataModel.newUser()
        }
        else{
            self.user = user!
            self.isEditMode = true
            self.password2 = user!.password
        }
    }
    
    //保存処理
    func save(){
        
        //入力チェック
        validationError = validation()
        
        guard validationError == .none else{
            isPresentedAlert = true
            return
        }
        
        if !isEditMode{
            CoreDataModel.insert(user)
        }
        //コミット
        CoreDataModel.save()
    }
    
    //キャンセル処理
    func cancel(){
        CoreDataModel.rollback()
    }
    
    //入力チェック
    private func validation() -> ValidationError{
        
        if user.nickname.isEmpty{
            return .emptyNickname
        }
        if user.userId.isEmpty{
            return .emptyUserId
        }
        if user.password.isEmpty{
            return .emptyPassword
        }
        if user.password != password2 {
            return .mismatchedPassword
        }
        
        return .none
        
    }
    
    
}
