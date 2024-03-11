

require_relative "lib/mslm/version"

Gem::Specification.new do |spec|
  spec.name = "mslm"
  spec.version = Mslm::VERSION
  spec.authors = ["Sahal Abdullah"]
  spec.email = ["sahal.abdullah@mslm.io"]

  spec.summary = "Provides functionalities for email verification and OTP (One-Time Password) generation and verification."
  spec.description = "RubyGem offering email verification and OTP (One-Time Password) generation and verification capabilities. Seamlessly integrate email verification and OTP functionality into Ruby applications with ease."
  spec.homepage = "https://github.com/mslmio/sdk-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"


  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mslmio/sdk-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/mslmio/sdk-ruby/blob/main/CHANGELOG.md"


  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

