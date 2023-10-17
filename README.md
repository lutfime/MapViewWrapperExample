# MapViewWrapperExample

When developing iOS apps that require maps, you often face the choice between Apple Maps and Google Maps. 

To address this challenge, you can establish a protocol (abstraction) that any map framework can conform to. Rather than interacting with specific map implementations, any class requiring map functionality interacts with this protocol, introducing a layer of flexibility to your code.

Map view implementation in this project
1. Apple Map View
2. Googe Map View (You need to have google maps key)
3. Fake Map View

To use this project you need to `pod install` first as this project uses Google Maps dependency.

This solution is discussed in more detail in this article:
https://wanlutfi.dev/2023/10/17/apple-maps-or-google-maps-designing-ios-code-for-seamless-switching-between-different-map-providers/
