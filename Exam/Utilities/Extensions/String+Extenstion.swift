//
//  Date+Extenstion.swift
//  Exam
//
//  Created by Jade Lapuz on 6/10/21.
//

import Foundation

enum DateFormats: String {
    case yyyyMMddTHHmmssz = "yyyy-MM-dd'T'HH:mm:ssZ"
}

extension String {

    func toDate(dateFormat: DateFormats = .yyyyMMddTHHmmssz) -> Date? {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = dateFormat.rawValue

        guard let date = dateFormatter.date(from: self) else {
            return nil
        }

        return date
    }

    func toFormattedDate(dateFormat: DateFormats = .yyyyMMddTHHmmssz) -> String? {
        let date = toDate(dateFormat: dateFormat)

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium

        guard let dateWithValue = date else {
            return nil
        }

        return dateFormatter.string(from: dateWithValue)
    }
}
