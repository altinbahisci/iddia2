class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  

  class Entry
    def initialize(title)
      @title = title
    end
    attr_reader :title
  end
  
  def scrape_reddit
    require 'openssl'
    require 'open-uri'
    require 'nokogiri'
    doc = Nokogiri::HTML(open('http://www.mackolik.com/iddaa-oyna', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE ,'User-Agent' => 'Nooby'))
    entries = doc.css('.iddaa-oyna-title2')
    @entriesArray = []
    
    entries.each do |entry|
      title = entry.css('td[ratesort="tarih_1"]').text
      @entriesArray << Entry.new(title)
    end  
      
    render template: 'scrape_reddit'
  end
end