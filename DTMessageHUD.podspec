Pod::Spec.new do |spec|
  spec.name = "DTMessageHUD"
  spec.version = "1.2.0"
  spec.summary = "Simple loading HUD and image message"
  spec.homepage = "https://github.com/danjiang/DTMessageHUD"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Dan Jiang" => 'danjiang5956@gmail.com' }
  spec.social_media_url = "https://twitter.com/danjianglife"

  spec.platform = :ios, "8.4"
  spec.requires_arc = true
  spec.swift_version = '4.0'
  spec.source = { git: "https://github.com/danjiang/DTMessageHUD.git", tag: spec.version, submodules: true }
  spec.source_files = "Sources/**/*.{h,swift}"
  spec.resources = "Sources/*.bundle"
end
