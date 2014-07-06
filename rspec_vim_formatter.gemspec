# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "rspec_vim_formatter"
  spec.version       = "0.0.1"
  spec.authors       = ["Mark Lorenz"]
  spec.email         = ["markjlorenz@dapplebeforedawn.com"]
  spec.description   = %q{output from rspec in VIMs quickfix format}
  spec.summary       = <<-SUMMARY
```
# running this command
bundle exec rspec --format RspecVimFormatter --out quickfix.out --format progress
```

```
# produces this quickfix.out
app/controllers/people_controller.rb:5: GET /peopleworks! (now write some real specs): Could not find table 'people'
```

Now you can load it in vim:
```
:cg quickfix.out
:cw
```

see `:help cw` for more information about VIM's quickfix
  SUMMARY
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "rspec", ">= 2.0.0"
end
