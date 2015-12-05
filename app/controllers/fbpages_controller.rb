class FbpagesController < ApplicationController
    
    require 'open-uri'
    require 'json'
    
    def index
        
        joongang = "https://graph.facebook.com/v2.5/155192444524300/insights/page_fans_country/lifetime?access_token=190854631255519|u_V4IfHNshG3-s9gpx7E55YjDYQ"
        
        result = JSON.parse(open(joongang).read)
        
        sum = 0
        result["data"][0]["values"][0]["value"].each do |value|
            sum = sum + value[1].to_i
        end
        render :json => sum
        
    end
end
