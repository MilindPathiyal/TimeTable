//
//  DayTask.swift
//  TimeTable
//
//  Created by Alex Lee on 06/07/2016.
//  Copyright © 2016 Milind Pathiyal. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class DayTask: Object {
    var isChecked = false
    var title = ""
    var startTime = ""
    var color = CGFloat(100)/255
}