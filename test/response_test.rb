require 'test_helper'

module CONTENTdmAPI
  describe Response do
    describe "when given valid JSON" do
      it "returns a Ruby hash" do
         Response.new(raw_data: '{"foo": "bar"}').parsed.must_equal({"foo"=>"bar"})
      end
    end

    describe "when given data with a bad collection" do
      it "returns a JSON formatted error code" do
        response = Response.new(raw_data: 'Error finding Collection foo')
        response.parsed['code'].must_equal '-2'
      end
    end
  end
end