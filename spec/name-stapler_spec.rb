require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "NameStapler" do
  it "should exist" do
    NameStapler.should_not be_nil
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
    require 'ruby-debug'; debugger
    puts ''
  end
end
