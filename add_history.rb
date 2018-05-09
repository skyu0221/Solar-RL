require 'csv'
Dir.glob("data/processed*.csv") do |f|
  puts f
  home_number = File.basename(f).split("_").last.split(".")[0]
  array=CSV.read("#{f}",:headers => true)
  # puts array[3][2]

  line_number=0
  CSV.open("data/added_hhdata_#{home_number}.csv","wb") do |csv|
  CSV.foreach("#{f}") do |row|
    if line_number==0
      csv << ["#{row[0]}","#{row[1]}","#{row[2]}","#{row[3]}","#{row[4]}","#{row[5]}","#{row[6]}","#{row[7]}","GH_month","GH_week","use_month","use_week"]
    end
    #puts row
    if line_number>=721
      csv << ["#{row[0]}","#{row[1]}","#{row[2]}","#{row[3]}","#{row[4]}","#{row[5]}","#{row[6]}","#{row[7]}","#{array[line_number-721][6]}","#{array[line_number-169][6]}","#{array[line_number-721][2]}","#{array[line_number-169][2]}"]
    end
    line_number=line_number+1
  end
  end
end


# array=CSV.read("data/processed_hhdata_26.csv",:headers => true)
# # puts array[3][2]
#
# line_number=0
# CSV.open("data/added_hhdata_26.csv","wb") do |csv|
# CSV.foreach("data/processed_hhdata_26.csv") do |row|
#   if line_number==0
#     csv << ["#{row[0]}","#{row[1]}","#{row[2]}","#{row[3]}","#{row[4]}","#{row[5]}","#{row[6]}","#{row[7]}","GH_month","GH_week"]
#   end
#   #puts row
#   if line_number>=721
#     csv << ["#{row[0]}","#{row[1]}","#{row[2]}","#{row[3]}","#{row[4]}","#{row[5]}","#{row[6]}","#{row[7]}","#{array[line_number-721][6]}","#{array[line_number-169][6]}"]
#   end
#   line_number=line_number+1
# end
# end
