module Moft
  class Command
    def self.globs(source, destination, static_includes)
      dirs = []
      Dir.chdir(source) do
        dirs = Dir['*'].select { |x| File.directory?(x) }
        dirs -= [destination, File.expand_path(destination), File.basename(destination)]
        dirs = dirs.map { |x| "#{x}/**/*" }
        dirs += ['*']
      end
      
      static_includes.each do |dir|
        if File.directory?(dir)
          dir.gsub("\\","/")
          dirs += ["%s/**/*" % [dir]]
        end
        
        return dirs
      end
      
    end

    # Static: Run Site#process and catch errors
    #
    # site - the Moft::Site object
    #
    # Returns nothing
    def self.process_site(site)
      site.process
    rescue Moft::FatalException => e
      puts
      Moft::Logger.error "ERROR:", "YOUR SITE COULD NOT BE BUILT:"
      Moft::Logger.error "", "------------------------------------"
      Moft::Logger.error "", e.message
      exit(1)
    end
  end
end
