import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "clear" asset catalog image resource.
    static let clear = DeveloperToolsSupport.ImageResource(name: "clear", bundle: resourceBundle)

    /// The "clear-sky" asset catalog image resource.
    static let clearSky = DeveloperToolsSupport.ImageResource(name: "clear-sky", bundle: resourceBundle)

    /// The "cloudy" asset catalog image resource.
    static let cloudy = DeveloperToolsSupport.ImageResource(name: "cloudy", bundle: resourceBundle)

    /// The "overcast-sky" asset catalog image resource.
    static let overcastSky = DeveloperToolsSupport.ImageResource(name: "overcast-sky", bundle: resourceBundle)

    /// The "partly-cloudy" asset catalog image resource.
    static let partlyCloudy = DeveloperToolsSupport.ImageResource(name: "partly-cloudy", bundle: resourceBundle)

    /// The "partlycloudy" asset catalog image resource.
    static let partlycloudy = DeveloperToolsSupport.ImageResource(name: "partlycloudy", bundle: resourceBundle)

    /// The "rain" asset catalog image resource.
    static let rain = DeveloperToolsSupport.ImageResource(name: "rain", bundle: resourceBundle)

    /// The "rainy" asset catalog image resource.
    static let rainy = DeveloperToolsSupport.ImageResource(name: "rainy", bundle: resourceBundle)

    /// The "sunny" asset catalog image resource.
    static let sunny = DeveloperToolsSupport.ImageResource(name: "sunny", bundle: resourceBundle)

    /// The "sunny2" asset catalog image resource.
    static let sunny2 = DeveloperToolsSupport.ImageResource(name: "sunny2", bundle: resourceBundle)

    /// The "sunrise" asset catalog image resource.
    static let sunrise = DeveloperToolsSupport.ImageResource(name: "sunrise", bundle: resourceBundle)

    /// The "sunset" asset catalog image resource.
    static let sunset = DeveloperToolsSupport.ImageResource(name: "sunset", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "clear" asset catalog image.
    static var clear: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .clear)
#else
        .init()
#endif
    }

    /// The "clear-sky" asset catalog image.
    static var clearSky: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .clearSky)
#else
        .init()
#endif
    }

    /// The "cloudy" asset catalog image.
    static var cloudy: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .cloudy)
#else
        .init()
#endif
    }

    /// The "overcast-sky" asset catalog image.
    static var overcastSky: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .overcastSky)
#else
        .init()
#endif
    }

    /// The "partly-cloudy" asset catalog image.
    static var partlyCloudy: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .partlyCloudy)
#else
        .init()
#endif
    }

    /// The "partlycloudy" asset catalog image.
    static var partlycloudy: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .partlycloudy)
#else
        .init()
#endif
    }

    /// The "rain" asset catalog image.
    static var rain: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rain)
#else
        .init()
#endif
    }

    /// The "rainy" asset catalog image.
    static var rainy: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rainy)
#else
        .init()
#endif
    }

    /// The "sunny" asset catalog image.
    static var sunny: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .sunny)
#else
        .init()
#endif
    }

    /// The "sunny2" asset catalog image.
    static var sunny2: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .sunny2)
#else
        .init()
#endif
    }

    /// The "sunrise" asset catalog image.
    static var sunrise: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .sunrise)
#else
        .init()
#endif
    }

    /// The "sunset" asset catalog image.
    static var sunset: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .sunset)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "clear" asset catalog image.
    static var clear: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .clear)
#else
        .init()
#endif
    }

    /// The "clear-sky" asset catalog image.
    static var clearSky: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .clearSky)
#else
        .init()
#endif
    }

    /// The "cloudy" asset catalog image.
    static var cloudy: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .cloudy)
#else
        .init()
#endif
    }

    /// The "overcast-sky" asset catalog image.
    static var overcastSky: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .overcastSky)
#else
        .init()
#endif
    }

    /// The "partly-cloudy" asset catalog image.
    static var partlyCloudy: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .partlyCloudy)
#else
        .init()
#endif
    }

    /// The "partlycloudy" asset catalog image.
    static var partlycloudy: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .partlycloudy)
#else
        .init()
#endif
    }

    /// The "rain" asset catalog image.
    static var rain: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rain)
#else
        .init()
#endif
    }

    /// The "rainy" asset catalog image.
    static var rainy: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rainy)
#else
        .init()
#endif
    }

    /// The "sunny" asset catalog image.
    static var sunny: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .sunny)
#else
        .init()
#endif
    }

    /// The "sunny2" asset catalog image.
    static var sunny2: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .sunny2)
#else
        .init()
#endif
    }

    /// The "sunrise" asset catalog image.
    static var sunrise: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .sunrise)
#else
        .init()
#endif
    }

    /// The "sunset" asset catalog image.
    static var sunset: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .sunset)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ColorResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ImageResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

