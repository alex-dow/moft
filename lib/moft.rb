$:.unshift File.dirname(__FILE__) # For use/testing when no gem is installed

# Require all of the Ruby files in the given directory.
#
# path - The String relative path from here to the directory.
#
# Returns nothing.
def require_all(path)
  glob = File.join(File.dirname(__FILE__), path, '*.rb')
  Dir[glob].each do |f|
    require f
  end
end

# rubygems
require 'rubygems'

# stdlib
require 'fileutils'
require 'time'
require 'safe_yaml'
# require 'English'

# 3rd party
require 'liquid'
require 'maruku'
require 'colorator'

# internal requires
require 'moft/core_ext'
require 'moft/logger'
require 'moft/deprecator'
require 'moft/configuration'
require 'moft/site'
require 'moft/convertible'
require 'moft/layout'
require 'moft/page'
require 'moft/post'
require 'moft/draft'
require 'moft/filters'
require 'moft/static_file'
require 'moft/errors'

# extensions
require 'moft/plugin'
require 'moft/converter'
require 'moft/generator'
require 'moft/command'

require_all 'moft/commands'
require_all 'moft/converters'
require_all 'moft/converters/markdown'
require_all 'moft/generators'
require_all 'moft/tags'

SafeYAML::OPTIONS[:suppress_warnings] = true

module Moft
  VERSION = '1.0.2'

  # Public: Generate a Moft configuration Hash by merging the default
  # options with anything in _config.yml, and adding the given options on top.
  #
  # override - A Hash of config directives that override any options in both
  #            the defaults and the config file. See Moft::Configuration::DEFAULTS for a
  #            list of option names and their defaults.
  #
  # Returns the final configuration Hash.
  def self.configuration(override)
    config = Configuration[Configuration::DEFAULTS]
    override = Configuration[override].stringify_keys
    config = config.read_config_files(config.config_files(override))

    # Merge DEFAULTS < _config.yml < override
    config = config.deep_merge(override).stringify_keys
    set_timezone(config['timezone']) if config['timezone']

    config
  end

  # Static: Set the TZ environment variable to use the timezone specified
  #
  # timezone - the IANA Time Zone
  #
  # Returns nothing
  def self.set_timezone(timezone)
    ENV['TZ'] = timezone
  end
end
