#lib/tasks/import.rake
desc "Imports a CSV file into an ActiveRecord table"
task :csv_model_import, [:filename, :model] => :environment do |task,args|
  lines = File.new(args[:filename]).readlines
  header = lines.shift.strip
  keys = header.split(',')
  lines.each do |line|
    values = line.strip.split(',')
    attributes = Hash[keys.zip values]
    Module.const_get(args[:model]).create(attributes)
  end
end

## EXAMPLE ##
# > rake csv_model_import[bunnies.csv,Bunny]
# name,age,favorite_food
# tabitha,2,carrots
# elijah,1,lettuce
# beatrice,3,apples