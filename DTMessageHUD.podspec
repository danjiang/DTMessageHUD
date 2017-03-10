Pod::Spec.new do |spec|
  spec.name = "DTMessageHUD"
  spec.version = "1.1.0"
  spec.summary = "Simple loading HUD and image message"
  spec.homepage = "https://github.com/danjiang/DTMessageHUD"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Dan Jiang" => 'dan@danthought.com' }
  spec.social_media_url = "http://twitter.com/dtstudio"

  spec.platform = :ios, "8.4"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/danjiang/DTMessageHUD.git", tag: spec.version, submodules: true }
  spec.source_files = "Sources/**/*.{h,swift}"
  spec.resources = "Sources/*.bundle"
end
