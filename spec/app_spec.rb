require 'spec_helper'

describe "PLNTR features" do
  describe "search feature" do
    it "should show test welcome message" do
      # get '/'
      # expect(last_response.body).to eq("[{\"message\":\"Welcome to PLNTR API! Go to https://github.com/botrethewey/Plntr-API\"}]")
      # expect(last_response.status).to eq(200)
    end

    it "should return all Zipcode objects" do
      # get '/zipcodes'
      # expect(last_response.status).to eq(200)
    end

    it "should return paginated Zipcode objects by page" do
      # ['1', '2', '300', '1000'].each do |good|
      #   url = '/zipcodes?page=' + good
      #   get url
      #   expect(last_response.status).to eq(200)
      # end
    end

    it "should return an error message for invalid page" do
      # ['', ' ', '0', '-10', 'one'].each do |bad|
      #   url = '/zipcodes?page=' + bad
      #   get url
      #   expect(last_response.body).to eq("[{\"message\":\"Invalid Page Query\"}]")
      #   expect(last_response.status).to eq(404)
      # end
    end


    it "should return Zipcode objects filtered by zones" do
      # ['', ' ', '1', '2', '2a', '13', '13b'].each do |good|
      #   url = '/zipcodes?zone=' + good
      #   get url
      #   expect(last_response.status).to eq(200)
      # end
    end

    it "should return an empty array when filtered by invalid zones" do
      # ['-34', '20a', '2100', '3f', '13c', 'two'].each do |bad|
      #   url = '/zipcodes?zone=' + bad
      #   get url
      #   expect(last_response.body).to eq("[]")
      #   expect(last_response.status).to eq(200)
      # end
    end

    it "should return a specific Zipcode object" do
      # ['12345', '98144', '98102', '43085', '43215'].each do |good|
      #   url = '/zipcodes/'+ good
      #   get url
      #   expect(last_response.status).to eq(200)
      # end
    end

    it "should return an error message for invalid zipcodes" do
      # ['00000', '*****', '123-4'].each do |bad|
      #   url = '/zipcodes/' + bad
      #   get url
      #   # puts last_response.body
      #   expect(last_response.body).to eq("[{\"message\":\"Plant Hardiness Zone Not Found\"}]")
      #   expect(last_response.status).to eq(404)
      # end
    end
  end
end
