# frozen_string_literal: true

require_relative "lib/struct_cast/version"

Gem::Specification.new do |spec|
  spec.name          = "struct_cast"
  spec.version       = StructCast::VERSION
  spec.authors       = ["Yuji Hanamura"]
  spec.email         = ["yuji.developer@gmail.com"]

  spec.summary       = <<~SUMMARY
    StructCast provides the refinement module that defines the method for casting to a Struct object.
  SUMMARY
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/yujideveloper/struct_cast"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/yujideveloper/struct_cast/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
