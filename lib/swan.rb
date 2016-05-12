require 'swan/version'

module Swan
  class Downloader
    def init(filename)
      if File.file?(filename)
        puts "File #{filename} already exists. Override? (y/N)"
        input = gets.strip

        return unless input == 'Y' || input == 'y'
      end

      open(File.join(File.dirname(__FILE__), 'swan', 'templates', 'config.yml')) do |template|
        open(filename, 'wb') do |file|
          file.puts template.read
          puts "File #{filename} was successfully created."
        end
      end
    end

    def download(files, options)
      files.each do |filename, params|
        if params.nil? || params.empty?
          puts "Skipping #{filename}"
          next
        end
        keyname = filename
        if params.is_a? String
          url = params
        else
          url = params['url']

          filename = params['filename'] if params.key? 'filename'

          filename = File.join(params['dir'], filename) if params.key? 'dir'
        end

        if (!options[:only].empty? && options[:only].include?(keyname)) || options[:only].empty?
          download_file filename, url
        end
      end
    end

    private

    def download_file(filename, url)
      print "Trying to download from #{url} to #{filename} ... "
      begin
        open(filename, 'wb') do |file|
          file.puts open(url).read
          puts 'done.'
        end
      rescue OpenURI::HTTPError => ex
        puts "\nError while accessing remote file: #{ex.message}"
      rescue => ex
        puts "\nError during download: #{ex.message}"
      end
    end
  end
end
