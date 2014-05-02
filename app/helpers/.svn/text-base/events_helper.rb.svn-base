module EventsHelper
  
  #Returns a nicely formated date depending on whether start and end are different.
  def eventdate(startdate, enddate)
    if startdate == enddate
       return enddate.strftime('%d. %b  %Y')
    else 
       return startdate.strftime('%d. %b %Y') + " - " + enddate.strftime('%d. %b  %Y') 
    end
  end  
  
  
end
