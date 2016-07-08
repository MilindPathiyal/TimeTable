//
//  RealmHelper.swift
//  TimeTable
//
//  Created by Alex Lee on 06/07/2016.
//  Copyright © 2016 Milind Pathiyal. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    
    static func addTask(dayTask: DayTask){
        let realm = try! Realm()
        try! realm.write(){
            realm.add(dayTask)
        }
    }
    
    static func deleteTask(dayTask: DayTask){
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(dayTask)
        }
    }
    
    static func updateTaskIsChecked(taskToBeUpdated: DayTask, isChecked: Bool) {
        let realm = try! Realm()
        try! realm.write() {
            taskToBeUpdated.isChecked = isChecked
        }
    }
    
    static func retrieveTask(day:Day) -> Results<DayTask> {
        let realm = try! Realm()
        return realm.objects(DayTask).filter("day = '\(day.rawValue)'").sorted("startTime", ascending: true)
    }
}
