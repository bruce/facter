#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../spec_helper'

describe "Per Interface IP facts" do
    it "should replace the ':' in an interface list with '_'" do
        Facter.fact(:kernel).stubs(:value => "SunOS")
        Facter::Util::IP.stubs(:get_interfaces => %w{eth0:1 eth1:2})
        Facter.fact(:interfaces).value.should == %{eth0_1,eth1_2}
    end
end
