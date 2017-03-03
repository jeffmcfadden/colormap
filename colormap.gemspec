$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "colormap/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "colormap"
  s.version     = Colormap::VERSION
  s.authors     = ["Jeff McFadden"]
  s.email       = ["jeff.mcfadden@gmail.com"]
  s.homepage    = "https://www.github.com/jeffmcfadden/colormap"
  s.summary     = "Map values to Colors."
  s.description = "Utility for mapping values to colors. Think temperature maps, density maps, etc."

  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "README.md"]
  s.test_files = Dir["test/**/*"]
  
  s.add_runtime_dependency "color", ["= 1.8"]
end