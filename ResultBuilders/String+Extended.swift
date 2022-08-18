import Foundation

extension String {
    func separate(every stride: Int = 4, from start: Int = 0, with separator: Character = " ") -> String {
        .init(enumerated().flatMap { $0 != 0 && ($0 == start || $0 % stride == start) ? [separator, $1] : [$1] })
    }

    static func string(for header: Copy.Header) -> String {
        header.rawValue
    }

    static func string(for header: Copy.Footer) -> String {
        header.rawValue
    }
}
