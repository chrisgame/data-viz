require 'bundler'
Bundler.require(:development)

task :default => [:tsv_csv]

task :tsv_csv do
  require 'csv'
 
  path = File.expand_path File.dirname(__FILE__)
  path + '/public/data'

  Dir.glob(path + '/**/*.tsv').each do |filename|
    binding.pry
    csv_file = CSV.read(filename, {:col_sep => "\t"})
    File.open(filename.gsub('tsv','csv'), 'w') {|filename| filename.write(csv_file)} 
  end
end

task :broken_csv do
  path = File.expand_path File.dirname(__FILE__)
  path + '/public/data'

  binding.pry
  Dir.glob(path + '/**/*.tsv').each do |filename|
    file = File.open(filename, "rb")
    contents = file.read
    new_file = contents.gsub('[','').gsub('],',"\n").gsub(']','')
    File.open(filename.gsub('tsv','csv'), 'w') {|filename| filename.write(new_file)} 
  end
end
