# encoding: UTF-8
require 'spec_helper'

describe HL7::Message::Segment::OBX do
  context 'general' do
    before :all do
      @base = "OBX||TX|FIND^FINDINGS^L|1|This is a test on 05/02/94.||||0.1|||||||Observer^Responsible||||^A Site|||The Organization|444 Observer Road^Suite 4^Ann Arbor^MI^99999^USA|Smith^John"
    end

    it 'allows access to an OBX segment' do
      obx = HL7::Message::Segment::OBX.new @base
      obx.set_id.should == ""
      obx.value_type.should == "TX"
      obx.observation_id.should == "FIND^FINDINGS^L"
      obx.observation_sub_id.should == "1"
      obx.observation_value.should == "This is a test on 05/02/94."
      obx.probability.should == '0.1'
      obx.responsible_observer.should =='Observer^Responsible'
      obx.observation_site.should == '^A Site'
      obx.performing_organization_name.should == 'The Organization'
      obx.performing_organization_address.should == '444 Observer Road^Suite 4^Ann Arbor^MI^99999^USA'
      obx.performing_organization_medical_director.should == 'Smith^John'
    end

    it 'allows creation of an OBX segment' do
      obx = HL7::Message::Segment::OBX.new
      obx.value_type = "TESTIES"
      obx.observation_id = "HR"
      obx.observation_sub_id = "2"
      obx.observation_value = "SOMETHING HAPPENned"
    end
  end
end
