//
//  CoreDataModel.swift
//  CoreDataAndSwiftUI
//
//  Created by 神村亮佑 on 2020/07/08.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import Foundation
import CoreData


class CoreDataModel{
    
    //AppDelegateに定義されたものを参照
    
    private static var persistentContainer: NSPersistentCloudKitContainer! = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    //Contextを返却
    private static var context: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    //初期化
    private init(){
        
    }
    
    //挿入
    static func insert(_ object: NSManagedObject){
        context.insert(object)
    }
    
    //削除
    static func delete(_ object: NSManagedObject){
        context.delete(object)
    }
    
    //保存
    static func save(){
        persistentContainer.saveContext(context: context)
    }
    
    //取り消し
    static func rollback(){
        persistentContainer.rollback(context: context)
    }
}

extension CoreDataModel{
    
    
    //ユーザー情報を取得
    static func allUsers() -> [User] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //nickname でソート
        let sortDescriptor = NSSortDescriptor(key: "nickname", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            return try context.fetch(request) as! [User]
        }
        catch{
            fatalError()
        }
    }
    
    static func newUser() -> User{
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)!
        let user = User(entity: entity, insertInto: nil)
        return user
    }
}
