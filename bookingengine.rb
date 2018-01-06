#2017-11-18..2017-11-24
#for these given inputs try to book "the range should  not be there while booking with in the range"
require 'Date'
require 'pry'
bookings_this_month=(Date.parse("2017-11-17")..Date.parse("2017-10-28"))
puts "hello! welcome to formula one "
puts 'enter the startdate'
puts "enter in the order of yyyy-mm-dd"
startdate=Date.parse(gets.chomp)
puts "enter the last date of booking yyyy-mm-dd"
lastdate=Date.parse(gets.chomp)
if(bookings_this_month.to_a.include?(startdate))#if true then the booking will not be possible
	  puts "the booking is not possible"
else
        if((startdate<bookings_this_month.first )&&(lastdate<(bookings_this_month.first)))     	
        	puts "the confirmation can be done for the date range of"
        	puts "#{startdate}to#{lastdate}"
        	bookings_this_month=(Date.parse(startdate)..Date.parse("2017-09-10"))
        elsif(startdate>(bookings_this_month.last))
           puts "the confirmation can be done for the date range"
           puts "#{startdate}to #{lastdate}"
           startdate="2017-11-18"
           bookings_this_month=(Date.parse (startdate)..Date.parse(lastdate)).to_a
        elsif((startdate>(bookings_this_month.last))&&(lastdate<startdate))
        	puts "we cant move to the past"
        end
end
