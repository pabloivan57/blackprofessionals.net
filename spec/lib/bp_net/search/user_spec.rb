require 'spec_helper'

describe BPNet::Search::User do

   let!(:user_1) do
     create(:user, first_name: 'Pablo',
                   last_name: 'Ochoa',
                   job_title: 'Programmer')
   end

   let!(:user_2) do
     create(:user, first_name: 'Jacky',
                   last_name: 'Tsai',
                   job_title: 'Student')
   end

   let!(:user_3) do
     create(:user, first_name: 'Jessica',
                   last_name: 'Saymon',
                   job_title: 'Developer')
   end

   let(:search_params) do
    { first_name: 'Jacky',
      last_name: '',
      job_title: 'Developer' }
   end

   describe "#find" do
     it 'returns search according to the passed attributes' do
       search = described_class.new(search_params)
       results = search.find
       expect(results).to match_array([user_2, user_3])
     end

     it 'returns all users if we there are not any filter attributes' do
       search  = described_class.new({})
       results = search.find
       expect(results).to match_array([user_1, user_2, user_3])
     end
   end
end

