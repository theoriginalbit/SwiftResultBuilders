import Foundation

@resultBuilder
enum SettingsSectionItemBuilder {
    // MARK: - Minimum Implementation Required for use case

    /// Combines an array of partial results into a single partial result. A result builder must implement this method.
    static func buildBlock(_ components: [SettingsSectionItem]...) -> [SettingsSectionItem] {
        components.flatMap { $0 }
    }

    /// Builds a partial result from a partial result that can be `nil`.
    ///
    /// Implement this method to support `if` statements that **don’t include** an `else` clause.
    ///
    /// ```
    /// Section {
    ///     ...
    ///     if condition {
    ///         Item()
    ///     }
    /// }
    /// ```
    static func buildOptional(_ components: [SettingsSectionItem]?) -> [SettingsSectionItem] {
        components ?? []
    }

    /// Builds a partial result from an expression. You can implement this method to perform preprocessing—for example, converting
    /// expressions to an internal type—or to provide additional information for type inference at use sites.
    ///
    /// This app uses it to convert a single item into an array of items, allowing the result builder to be far simpler.
    static func buildExpression(_ expression: SettingsSectionItem) -> [SettingsSectionItem] {
        [expression]
    }

    // MARK: - Additional Implementation To Support More

    /// Builds a partial result whose value varies depending on some condition.
    ///
    /// Implement both this method and `buildEither(second:)` to support `switch` statements and `if` statements that **include** an `else` clause.
    static func buildEither(first components: [SettingsSectionItem]) -> [SettingsSectionItem] {
        components
    }

    /// Builds a partial result whose value varies depending on some condition.
    ///
    /// Implement both this method and `buildEither(first:)` to support `switch` statements and `if` statements that **include** an `else` clause.
    static func buildEither(second components: [SettingsSectionItem]) -> [SettingsSectionItem] {
        components
    }

    /// Builds a partial result from an array of partial results.
    ///
    /// Implement this method to support `for` loops.
    static func buildArray(_ components: [[SettingsSectionItem]]) -> [SettingsSectionItem] {
        components.flatMap { $0 }
    }

    /// Builds a partial result that propagates or erases type information outside a compiler-control statement that performs an availability check.
    /// You can use this to erase type information that varies between the conditional branches.
    static func buildLimitedAvailability(_ components: [SettingsSectionItem]) -> [SettingsSectionItem] {
        components
    }
}
