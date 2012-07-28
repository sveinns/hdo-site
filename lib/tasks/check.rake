namespace :check do
  desc 'Check tabs vs spaces'
  task :tabs do
    failures = Dir['**/*.{rb,css,less,js}'].select do |path|
      print "."
      File.read(path).include? "\t"
    end
    puts
    
    unless failures.empty?
      raise "found tab characters in the following files:\n#{failures.join "\n"}"
    end
  end
  
  desc 'Check that no .scss files exist'
  task :scss do
    scss = Dir['**/*.scss']
    
    unless scss.empty?
      raise "found scss files:\n #{scss.join "\n"}"
    end
  end
end

task :check => %w[check:tabs check:scss]