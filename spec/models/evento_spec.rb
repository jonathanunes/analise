require 'rails_helper'

RSpec.describe Evento, type: :model do

	describe "O evento deve possuir" do
    	it 'um nome' do 
    		evento = FactoryGirl.build(:evento, :nome => nil)
    		expect(evento).to_not be_valid
    	end

    	describe "um nome de facebook" do 
    		it 'sem http' do 
    			evento = FactoryGirl.create(:evento, :facebook => "http://facebook.com/BrasilGameShow")
    			expect(evento.facebook).to be_eql("BrasilGameShow")
    		end
    		it 'sem http' do 
    			evento = FactoryGirl.create(:evento, :facebook => "BrasilGameShow")	
    			expect(evento.facebook).to be_eql("BrasilGameShow")
    		end
    	end

    	describe "um nome de twitter" do 
    		it 'sem url do twitter' do
    			evento = FactoryGirl.create(:evento, :twitter => "https://twitter.com/brasilgameshow")
    			expect(evento.twitter).to be_eql("brasilgameshow")
    		end
    	end
  	end

end
