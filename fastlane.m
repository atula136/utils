> sudo gem install fastlane

> fastlane init

> fastlane snapshot init
/* fastlane/Snapfile */
-------
# A list of devices you want to take the screenshots from
devices([
  "iPhone 6",
  "iPhone 6 Plus",
  "iPhone 5"
])

languages([
  "en-US"
])

# The name of the scheme which contains the UI Tests
# scheme "SchemeName"

# Where should the resulting screenshots be stored?
output_directory "./fastlane/screenshots"

clear_previous_screenshots true # remove the '#' to clear all previously generated screenshots before creating new ones

# Latest version of iOS
ios_version '1.0'
-------

> fastlane deliver init
--------
/* fastlane/Fastfile */
desc "Create ipa"
  lane :build do
    increment_build_number
    gym
  end

  desc "Upload to App Store"
  lane :upload do
    deliver
  end

  # You can define as many lanes as you want
  desc "Take screenshots"
  lane :screenshot do
    snapshot
    frameit(white: true)
  end

  desc "Provision, take screenshots, build and upload to App Store"
  lane :do_everything do
    build
    upload
  end
--------
increment_build_number:
Set Versioning System to Apple Generic.
By default, Xcode does not use any versioning system. Setting Versioning System to Apple Generic ensures that Xcode will include all agvtool-generated version information in your project.
--------

> fastlane frameit
--------
brew install libpng jpeg imagemagick
--------
