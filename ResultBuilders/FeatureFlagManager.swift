struct FeatureFlagManager {
    static var shared = Self()

    enum Feature {
        case account, email, phone, tutorial
    }

    func isEnabled(_ feature: Feature) -> Bool {
        // this is just an example, no frills
        true
    }
}
