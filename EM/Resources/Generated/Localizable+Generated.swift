// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Button {
    /// Log in
    internal static let logIn = L10n.tr("Localizable", "button.logIn", fallback: "Log in")
    /// Localizable.strings
    ///   EM
    /// 
    ///   Created by Anton Zyabkin on 13.03.2023.
    internal static let signIn = L10n.tr("Localizable", "button.signIn", fallback: "Sing in")
    /// Sing in with Apple
    internal static let signInApple = L10n.tr("Localizable", "button.signInApple", fallback: "Sing in with Apple")
    /// Sing in with Google
    internal static let signInGoogle = L10n.tr("Localizable", "button.signInGoogle", fallback: "Sing in with Google")
  }
  internal enum Home {
    /// Brands
    internal static let brands = L10n.tr("Localizable", "home.brands", fallback: "Brands")
    /// Cars
    internal static let cars = L10n.tr("Localizable", "home.cars", fallback: "Cars")
    /// Flash Sale
    internal static let flashSale = L10n.tr("Localizable", "home.flashSale", fallback: "Flash Sale")
    /// Furniture
    internal static let furniture = L10n.tr("Localizable", "home.furniture", fallback: "Furniture")
    /// Games
    internal static let games = L10n.tr("Localizable", "home.games", fallback: "Games")
    /// Headphones
    internal static let headphones = L10n.tr("Localizable", "home.headphones", fallback: "Headphones")
    /// Kids
    internal static let kids = L10n.tr("Localizable", "home.kids", fallback: "Kids")
    /// Latest
    internal static let latest = L10n.tr("Localizable", "home.latest", fallback: "Latest")
    /// Location
    internal static let location = L10n.tr("Localizable", "home.location", fallback: "Location")
    /// Phones
    internal static let phones = L10n.tr("Localizable", "home.phones", fallback: "Phones")
    /// What are you looking for?
    internal static let searchPlaceholder = L10n.tr("Localizable", "home.searchPlaceholder", fallback: "What are you looking for?")
    /// Trade by
    internal static let title1 = L10n.tr("Localizable", "home.title1", fallback: "Trade by")
    /// bata
    internal static let title2 = L10n.tr("Localizable", "home.title2", fallback: "bata")
    /// View all
    internal static let viewAll = L10n.tr("Localizable", "home.viewAll", fallback: "View all")
  }
  internal enum Login {
    /// First name
    internal static let first = L10n.tr("Localizable", "login.first", fallback: "First name")
    /// Password
    internal static let password = L10n.tr("Localizable", "login.password", fallback: "Password")
    /// Welcome back
    internal static let title = L10n.tr("Localizable", "login.title", fallback: "Welcome back")
    /// Wrong login or password
    internal static let wrongMessage = L10n.tr("Localizable", "login.wrongMessage", fallback: "Wrong login or password")
  }
  internal enum Profile {
    /// Balance
    internal static let balance = L10n.tr("Localizable", "profile.balance", fallback: "Balance")
    /// Change photo
    internal static let changePhoto = L10n.tr("Localizable", "profile.changePhoto", fallback: "Change photo")
    /// Help
    internal static let help = L10n.tr("Localizable", "profile.help", fallback: "Help")
    /// Log out
    internal static let logOut = L10n.tr("Localizable", "profile.logOut", fallback: "Log out")
    /// Payment method
    internal static let paymentMethod = L10n.tr("Localizable", "profile.paymentMethod", fallback: "Payment method")
    /// Restore purchase
    internal static let restorePurchase = L10n.tr("Localizable", "profile.restorePurchase", fallback: "Restore purchase")
    /// Profile
    internal static let title = L10n.tr("Localizable", "profile.title", fallback: "Profile")
    /// Trade history
    internal static let tradeHistory = L10n.tr("Localizable", "profile.tradeHistory", fallback: "Trade history")
    /// Trade store
    internal static let tradeStore = L10n.tr("Localizable", "profile.tradeStore", fallback: "Trade store")
    /// Upload item
    internal static let uploadItemButton = L10n.tr("Localizable", "profile.uploadItemButton", fallback: "Upload item")
  }
  internal enum Reg {
    /// User name "First name" is already busy
    internal static let alreadyBusy = L10n.tr("Localizable", "reg.alreadyBusy", fallback: "User name \"First name\" is already busy")
    /// Email
    internal static let email = L10n.tr("Localizable", "reg.email", fallback: "Email")
    /// Enter first name
    internal static let enterFirstName = L10n.tr("Localizable", "reg.enterFirstName", fallback: "Enter first name")
    /// Enter last name
    internal static let enterLastName = L10n.tr("Localizable", "reg.enterLastName", fallback: "Enter last name")
    /// First name
    internal static let first = L10n.tr("Localizable", "reg.first", fallback: "First name")
    /// Already have an account?
    internal static let haveAccount = L10n.tr("Localizable", "reg.haveAccount", fallback: "Already have an account?")
    /// Invalid email
    internal static let invalidEmail = L10n.tr("Localizable", "reg.invalidEmail", fallback: "Invalid email")
    /// Last name
    internal static let last = L10n.tr("Localizable", "reg.last", fallback: "Last name")
    /// Sign in
    internal static let title = L10n.tr("Localizable", "reg.title", fallback: "Sign in")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
