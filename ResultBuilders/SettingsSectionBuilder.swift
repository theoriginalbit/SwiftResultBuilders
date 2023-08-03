//
//  SettingsSectionBuilder.swift
//  ResultBuilders
//
//  Created by Joshua Asbury on 3/8/2023.
//

import Foundation

@resultBuilder
enum SettingsSectionBuilder {
    // MARK: - Minimum Implementation Required for use case

    /// Combines an array of partial results into a single partial result. A result builder must implement this method.
    static func buildBlock(_ components: [SettingsSection]...) -> [SettingsSection] {
        components.flatMap { $0 }
    }

    /// Builds a partial result from a partial result that can be `nil`.
    ///
    /// Implement this method to support `if` statements that **don’t include** an `else` clause.
    ///
    /// ```
    /// if condition {
    ///     Section {
    ///         Item.signOut
    ///     }
    /// }
    /// Section {
    ///     ...
    /// }
    /// ```
    static func buildOptional(_ components: [SettingsSection]?) -> [SettingsSection] {
        components ?? []
    }

    /// Builds a partial result from an expression. You can implement this method to perform preprocessing—for example, converting
    /// expressions to an internal type—or to provide additional information for type inference at use sites.
    ///
    /// This app uses it to convert a single section into an array of sections, allowing the result builder to be far simpler.
    static func buildExpression(_ expression: SettingsSection) -> [SettingsSection] {
        [expression]
    }

    /// Builds a partial result from an expression. You can implement this method to perform preprocessing—for example, converting
    /// expressions to an internal type—or to provide additional information for type inference at use sites.
    ///
    /// This app uses it to convert `Item.signOut` section without needing to declare it within an empty `Section`, further reducing boilerplate.
    ///
    /// This:
    /// ```
    /// Section {
    ///     ...
    /// }
    ///
    /// Item.signOut
    ///
    /// Section {
    ///     ...
    /// }
    /// ```
    ///
    /// Instead of this:
    /// ```
    /// Section {
    ///     ...
    /// }
    /// Section {
    ///     Item.signOut
    /// }
    /// Section {
    ///     ...
    /// }
    /// ```
    static func buildExpression(_ expression: SettingsSection.Item) -> [SettingsSection] {
        [SettingsSection(header: nil, items: [expression], footer: nil)]
    }

    // MARK: - Additional Implementation To Support More

    /// Builds a partial result whose value varies depending on some condition.
    ///
    /// Implement both this method and `buildEither(second:)` to support `switch` statements and `if` statements that **include** an `else` clause.
    static func buildEither(first components: [SettingsSection]) -> [SettingsSection] {
        components
    }

    /// Builds a partial result whose value varies depending on some condition.
    ///
    /// Implement both this method and `buildEither(first:)` to support `switch` statements and `if` statements that **include** an `else` clause.
    static func buildEither(second components: [SettingsSection]) -> [SettingsSection] {
        components
    }

    /// Builds a partial result from an array of partial results.
    ///
    /// Implement this method to support `for` loops.
    static func buildArray(_ components: [[SettingsSection]]) -> [SettingsSection] {
        components.flatMap { $0 }
    }

    /// Builds a partial result that propagates or erases type information outside a compiler-control statement that performs an availability check.
    /// You can use this to erase type information that varies between the conditional branches.
    static func buildLimitedAvailability(_ components: [SettingsSection]) -> [SettingsSection] {
        components
    }
}
