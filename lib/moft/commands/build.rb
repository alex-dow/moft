module Moft
  module Commands
    class Build < Command
      def self.process(options)
        site = Moft::Site.new(options)

        self.build(site, options)
        self.watch(site, options) if options['watch']
      end

      # Private: Build the site from source into destination.
      #
      # site - A Moft::Site instance
      # options - A Hash of options passed to the command
      #
      # Returns nothing.
      def self.build(site, options)
        source = options['source']
        destination = options['destination']
        Moft::Logger.info "Source:", source
        Moft::Logger.info "Destination:", destination
        print Moft::Logger.formatted_topic "Generating..."
        self.process_site(site)
        puts "done."
      end

      # Private: Watch for file changes and rebuild the site.
      #
      # site - A Moft::Site instance
      # options - A Hash of options passed to the command
      #
      # Returns nothing.
      def self.watch(site, options)
        require 'directory_watcher'
        Moft::Logger.info "Move to Source:", options['source']
        Dir.chdir(options['source'])
          
        source = options['source']
        destination = options['destination']

        Moft::Logger.info "Auto-regeneration:", "enabled"

        watchdirs = self.globs(source, destination, options['static_includes'])
        
        watchdirs.each do |dir|
          Moft::Logger.info "Watching:", "%s" % dir
        end
        
        dw = DirectoryWatcher.new(source, :glob => watchdirs, :pre_load => true)
        dw.interval = 1

        dw.add_observer do |*args|
          t = Time.now.strftime("%Y-%m-%d %H:%M:%S")
          print Moft::Logger.formatted_topic("Regenerating:") + "#{args.size} files at #{t} "
          self.process_site(site)
          puts  "...done."
        end

        dw.start

        unless options['serving']
          trap("INT") do
            puts "     Halting auto-regeneration."
            exit 0
          end

          loop { sleep 1000 }
        end
      end
    end
  end
end
