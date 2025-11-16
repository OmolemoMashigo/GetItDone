#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "clear" asset catalog image resource.
static NSString * const ACImageNameClear AC_SWIFT_PRIVATE = @"clear";

/// The "clear-sky" asset catalog image resource.
static NSString * const ACImageNameClearSky AC_SWIFT_PRIVATE = @"clear-sky";

/// The "cloudy" asset catalog image resource.
static NSString * const ACImageNameCloudy AC_SWIFT_PRIVATE = @"cloudy";

/// The "overcast-sky" asset catalog image resource.
static NSString * const ACImageNameOvercastSky AC_SWIFT_PRIVATE = @"overcast-sky";

/// The "partly-cloudy" asset catalog image resource.
static NSString * const ACImageNamePartlyCloudy AC_SWIFT_PRIVATE = @"partly-cloudy";

/// The "partlycloudy" asset catalog image resource.
static NSString * const ACImageNamePartlycloudy AC_SWIFT_PRIVATE = @"partlycloudy";

/// The "rain" asset catalog image resource.
static NSString * const ACImageNameRain AC_SWIFT_PRIVATE = @"rain";

/// The "rainy" asset catalog image resource.
static NSString * const ACImageNameRainy AC_SWIFT_PRIVATE = @"rainy";

/// The "sunny" asset catalog image resource.
static NSString * const ACImageNameSunny AC_SWIFT_PRIVATE = @"sunny";

/// The "sunny2" asset catalog image resource.
static NSString * const ACImageNameSunny2 AC_SWIFT_PRIVATE = @"sunny2";

/// The "sunrise" asset catalog image resource.
static NSString * const ACImageNameSunrise AC_SWIFT_PRIVATE = @"sunrise";

/// The "sunset" asset catalog image resource.
static NSString * const ACImageNameSunset AC_SWIFT_PRIVATE = @"sunset";

#undef AC_SWIFT_PRIVATE
