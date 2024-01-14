//
//  Date+Ext.swift
//  GithubFollowers
//
//  Created by DA MAC M1 157 on 2024/01/13.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }

}
