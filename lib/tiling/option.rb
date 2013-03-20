# -*- encoding: utf-8 -*-

require 'optparse'

module Tiling

  # Public: Set the options.
  class Option

    def initialize
      @options = {horizontal: false, vertical: false, version: false }
      optparse = OptionParser.new do|opts|
        opts.on( '-H', '--horizontal', 'Horizontal layout' ) do
          @options[:horizontal] = true
        end
        opts.on( '-V', '--vertical', 'Vertical layout' ) do
          @options[:vertical] = true
        end
        opts.on( '-v', '--version', 'Print version number and exit' ) do
          @options[:version] = true
        end
        opts.on( '-h', '--help', 'Display this screen' ) do
          puts opts
          exit
        end
      end

      begin
        optparse.parse!
      rescue OptionParser::InvalidOption => e
        puts e.to_s
        exit 1
      end

      print_version if @options[:version]
    end

    def [](key)
      @options[key]
    end

    private

      def print_version
        puts "wlayout #{File.read(File.join($WLAYOUT_PATH, 'VERSION')).strip}" 
        exit
      end

  end

end

