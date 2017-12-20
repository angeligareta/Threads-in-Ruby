task :default => ["tu"]

desc "Interpreta el código y ejecuta el programa."
task :tu do
    ruby_files = Rake::FileList.new("test/*.rb")
    sh "ruby -I. #{ruby_files}"
end

task :chef do
    sh "ruby -I. lib/main.rb"
end