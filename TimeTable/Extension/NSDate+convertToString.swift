//
//  NSDate+convertToString.swift
//  TimeTable
//
//  Created by Alex Lee on 07/07/2016.
//  Copyright © 2016 Milind Pathiyal. All rights reserved.
//

import Foundation

extension NSDate {
    func convertToString() -> String {
    return NSDateFormatter.localizedStringFromDate(self, dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.MediumStyle)
    }
}