Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  s.name              = 'moft'
  s.version           = '1.0.5'
  s.license           = 'MIT'
  s.date              = '2013-06-25'
  s.rubyforge_project = 'moft'

  s.summary     = "A simple, static site generator that is based off of Jekyll."
  s.description = "Moft is a simple, static site generator. A fork of jekyll, designed for greater simplicity and less blog-related features."

  s.authors  = ["Alex Dowgailenko"]
  s.email    = 'alex.dowgailenko@gmail.com'
  s.homepage = 'http://www.psikon.com/'

  s.require_paths = %w[lib]

  s.executables = ["moft"]

  # s.rdoc_options = ["--charset=UTF-8"]
  # s.extra_rdoc_files = %w[README.textile LICENSE]

  s.add_runtime_dependency('liquid', "~> 2.3")
  s.add_runtime_dependency('directory_watcher', "~> 1.4.1")
  s.add_runtime_dependency('maruku', "~> 0.5")
  s.add_runtime_dependency('kramdown', "~> 0.14")
  s.add_runtime_dependency('commander', "~> 4.1.3")
  s.add_runtime_dependency('safe_yaml', "~> 0.7.0")
  s.add_runtime_dependency('colorator', "~> 0.1")
  s.add_runtime_dependency('syntax', "~> 1.0.0")

  s.add_development_dependency('rake', "~> 10.0.3")
  s.add_development_dependency('rdoc', "~> 3.11")
  s.add_development_dependency('redgreen', "~> 1.2")
  s.add_development_dependency('shoulda', "~> 3.3.2")
  s.add_development_dependency('rr', "~> 1.0")
  s.add_development_dependency('cucumber', "~> 1.2.1", '!= 1.2.4')
  s.add_development_dependency('RedCloth', "~> 4.2")
  s.add_development_dependency('rdiscount', "~> 1.6")
  s.add_development_dependency('redcarpet', "~> 2.2.2")
  s.add_development_dependency('launchy', "~> 2.1.2")
  s.add_development_dependency('simplecov', "~> 0.7")
  s.add_development_dependency('simplecov-gem-adapter', "~> 1.0.1")

  # = MANIFEST =
  s.files = %w[
    LICENSE
    bin/moft
    moft.gemspec
    lib/moft.rb
    lib/moft/command.rb
    lib/moft/commands/build.rb
    lib/moft/commands/new.rb
    lib/moft/commands/serve.rb
    lib/moft/configuration.rb
    lib/moft/converter.rb
    lib/moft/converters/identity.rb
    lib/moft/converters/markdown.rb
    lib/moft/converters/markdown/kramdown_parser.rb
    lib/moft/converters/markdown/maruku_parser.rb
    lib/moft/converters/markdown/rdiscount_parser.rb
    lib/moft/converters/markdown/redcarpet_parser.rb
    lib/moft/converters/textile.rb
    lib/moft/convertible.rb
    lib/moft/core_ext.rb
    lib/moft/deprecator.rb
    lib/moft/draft.rb
    lib/moft/errors.rb
    lib/moft/filters.rb
    lib/moft/generator.rb
    lib/moft/generators/pagination.rb
    lib/moft/layout.rb
    lib/moft/logger.rb
    lib/moft/mime.types
    lib/moft/page.rb
    lib/moft/plugin.rb
    lib/moft/post.rb
    lib/moft/site.rb
    lib/moft/static_file.rb
    lib/moft/tags/gist.rb
    lib/moft/tags/highlight.rb
    lib/moft/tags/include.rb
    lib/moft/tags/post_url.rb
    lib/site_template/_config.yml
    lib/site_template/_layouts/default.html
    lib/site_template/_layouts/post.html
    lib/site_template/_posts/0000-00-00-welcome-to-jekyll.markdown.erb
    lib/site_template/css/screen.css
    lib/site_template/css/syntax.css
    lib/site_template/images/.gitkeep
    lib/site_template/images/rss.png
    lib/site_template/index.html
  ]
  # = MANIFEST =

  # s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end
