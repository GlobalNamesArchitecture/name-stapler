require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "NameStapler" do

  before(:all) do
    @test_names = NameStapler::Spec::Config.test_names
  end

  it "should exist" do
    NameStapler.should_not be_nil
  end

  it "should associate links with names" do
    gni = NameStapler.new(NameStapler::LinkGni.new)
    gni.add_urls(@test_names)
    @test_names[:names][0][:urls].is_a?(Array).should be_true
  end
end

describe "NameStapler::LinkSource" do
  it "should exist" do
    NameStapler::LinkSource.should_not be_nil
  end
end

describe "NameStapler::LinkGni" do
  it "should find animalia" do
    gni = NameStapler::LinkGni.new
    res = gni.find("animalia")
    res[0].should == "http://gni.globalnames.org/name_strings/dee2fad2-770c-5740-8b2d-17f138e05175" 
  end
end
