require 'spec_helper'

feature 'Advanced Search' do

   given!(:user_1) do
     create(:user, first_name: 'Pablo',
                   last_name: 'Ochoa',
                   job_title: 'Programmer',
                   industry: 'Twitter',
                   school: 'USC')
   end

   given!(:user_2) do
     create(:user, first_name: 'Aril',
                   last_name: 'Jain',
                   job_title: 'Developer',
                   school: 'USC',
                   industry: 'Computer Science',
                   country: 'USA',
                   state: 'CA')
   end

   given!(:user_3) do
     create(:user, first_name: 'Jessica',
                   last_name: 'Raymon',
                   job_title: 'Student',
                   school: 'USC',
                   industry: 'Computational Biology',
                   country: 'USA',
                   state: 'CA')
   end

   background do
     sign_in user_1
     click_link 'Advanced'
   end

   scenario 'As as user, I want to search users by different field filters' do
     fill_in 'First name', with: 'Jessica'
     fill_in 'Title', with: 'Developer'

     click_button 'Search'

     within('#search_results .result:nth-child(1)') do
       expect(page).to have_text('Aril Jain')
     end
     within('#search_results .result:nth-child(2)') do
       expect(page).to have_text('Jessica Raymon')
     end
   end
end
