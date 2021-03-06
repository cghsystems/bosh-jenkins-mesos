require 'spec_helper'

describe 'Apache Storm Mesos release' do
  context 'Storm UI is running' do
    let(:storm_ui_url) { 'http://10.244.1.22:8080/' }

    it 'has an accessible home page' do
      status_code = Faraday.head(storm_ui_url).status
      expect(status_code).to eq(200)
    end
  end 

  context 'Storm Nimbus is running' do

    it 'is registered with Mesos master' do
      storm = mesos_master_state_json.fetch('frameworks').find do |framework|
         framework.fetch('name') == 'Storm!!!'
      end

      expect(storm).not_to be_nil
      expect(storm['name']).to eql('Storm!!!')
    end    


   xit 'accepts a tuple' do

   end
  end
end

