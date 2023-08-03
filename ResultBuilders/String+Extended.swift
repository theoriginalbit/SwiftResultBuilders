//
//  String+Extended.swift
//  ResultBuilders
//
//  Created by Joshua Asbury on 27/5/2023.
//

extension String {
    func separate(every stride: Int = 4, from start: Int = 0, with separator: Character = " ") -> String {
        .init(enumerated().flatMap { $0 != 0 && ($0 == start || $0 % stride == start) ? [separator, $1] : [$1] })
    }
}
