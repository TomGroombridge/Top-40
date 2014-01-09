# require "open-uri"

# body = ''
# stats = open('http://www.bigeast.com/sports/w-fieldh/stats/2013-2014/odu.html') {|f|
#  body = f.read}
#  # puts body
#  # p body
#  test = "dfdgddfgdfddfdfdfdfdstephenstephen"
#  a = test.scan(/stephen/)
#  goalshots = body.scan(/Goals-Shot attempts.+?[\S\s]+?<td align=center><font face=verdana size=1 color="#000000">(.+?)&nbsp/)
# p goalshots


require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.bbc.co.uk/radio1/chart/singles'))
# doc = doc.body.gsub("\n","")
# /html/body/ul/font[2]/center/p[1]/table/tbody/tr[3]/td[2]/font
artist = []
doc.css('.cht-entry-artist').each do |link|
artist <<  link.content
end

title = []
doc.css('.cht-entry-title').each do |song|
title << song.content
end


number = artist.zip(title)

artist_1 = Hash[*number]

arr = []
# if artist.count == title.count
	artist.each_with_index do |a, i|
		arr << {artist: a, title: title[i]}
		arr
	# end
end



 arr.each_with_index {|a, i| p "at number #{i+1} we have #{a[:artist]} with their song #{a[:title]}"}




