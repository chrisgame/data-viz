require 'bundler'
Bundler.require(:development)
require 'pp'

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

task :broken_tsv_to_csv do
  path = File.expand_path File.dirname(__FILE__)
  path + '/public/data'

  binding.pry
  Dir.glob(path + '/**/*.tsv').each do |filename|
    file = File.open(filename, "rb")
    contents = file.read
    new_file = contents.gsub('[','').gsub('],',"\n").gsub(']','').gsub('"','').gsub(', ','')
    File.open(filename.gsub('tsv','csv'), 'w') {|filename| filename.write(new_file)} 
  end
end

task :scrape do
  mech = Mechanize.new

  page = mech.get 'http://www.formula1.com/results/season/'

  mech.page.link_with(:text => '2013').click
  mech.page.link_with(:text => 'AUSTRALIA').click
  mech.page.link_with(:text => 'FASTEST LAPS').click

  headings = mech.page.search('table.raceResults').search('tr').search('th').map{ |n| n.text }
  laps = mech.page.search('table.raceResults').search('tr').map do |n| 
    n.search('td').map{ |n| n.text } unless n.search('td').empty?
  end  


  results = []
  laps.compact.each do |lap|
    results << headings.zip(lap)
  end

  binding.pry
  pp results.to_json
end
