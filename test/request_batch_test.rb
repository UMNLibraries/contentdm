require 'test_helper'
require_relative '../lib/contentdm/service'
require_relative '../lib/contentdm/request'
require_relative '../lib/contentdm/request_batch'

module Contentdm
  describe Contentdm::RequestBatch do
    it 'fetches and merges a set of services' do
      services = [{function: 'wsAPIDescribe'}, {function: 'dmGetLocale'}]
      requests = Contentdm::RequestBatch.new(base_url: "https://server16022.contentdm.oclc.org/dmwebservices/index.php", services: services)
      VCR.use_cassette("request_batch") do
        response = requests.fetch
        response.must_equal [{:service=>"wsAPIDescribe", :value=>{"version"=>"0.6"}}, {:service=>"dmGetLocale", :value=>{"locale"=>"en_US"}}]
      end
    end

    describe 'when requested resources do not exist' do
      it 'indicates requested items were not found' do
        services = [{function: 'dmGetItemInfo', params: ['spl', 3249082389234]}, {function: 'dmGetCompoundObjectInfo', params: ['spl', 3249082389234]}]
        requests = Contentdm::RequestBatch.new(base_url: "https://server16022.contentdm.oclc.org/dmwebservices/index.php", services: services)
        VCR.use_cassette("request_batch_records_not_found") do
          response = requests.fetch
          response.must_equal [{:service=>"dmGetItemInfo", :value=>{"code"=>"-2", "message"=>"Requested item not found", "restrictionCode"=>"-1"}}, {:service=>"dmGetCompoundObjectInfo", :value=>{"message"=>"Requested item is not compound", "code"=>"-2"}}]
        end
      end
    end
  end
end