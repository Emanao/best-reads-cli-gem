# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'best_reads/version'

Gem::Specification.new do |spec|
  spec.name          = "best_reads"
  spec.version       = BestReads::VERSION
  spec.authors       = ["Eva Navarro"]
  spec.email         = ["emanao@me.com"]

  spec.summary       = %q{ Best-of book lists.}
  spec.description   = %q{ Provides the ranking lists of best books in the us.}
  spec.homepage      = "https://learn.co"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($\)
  #spec.bindir        = "exe"
  spec.executables   = ["best_reads"]
  spec.require_paths = ["lib","lib/best_reads"]

  spec.add_development_dependency "bundler", ">= 2.2.10"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 0"
  spec.add_development_dependency "nokogiri", "~> 1.11.4"
  spec.add_development_dependency "pry", "~> 0"
end