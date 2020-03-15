platform :ios, '13.0'
use_frameworks!

workspace 'Weather'

project 'Weather/Weather.xcodeproj'
project 'WeatherApi/WeatherApi.xcodeproj'

target :Weather do
  project 'Weather/Weather.xcodeproj'

  pod 'SwiftLint', '~> 0.39.1'
  pod 'Alamofire', '~> 5.0'
end

target :WeatherApi do
  project 'WeatherApi/WeatherApi.xcodeproj'
  
  pod 'SwiftLint', '~> 0.39.1'
  pod 'Alamofire', '~> 5.0'
end
