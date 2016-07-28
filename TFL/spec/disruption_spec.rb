# encoding: UTF-8
require "rails_helper"
require "spec_helper"


describe "TFL Disruption road API" do
  let(:disruptions)  { Disruption.all }

  it "contains valid data" do
       expect(disruptions.all?).to be_truthy
  end

end
