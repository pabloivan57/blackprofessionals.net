FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "login#{n}@bp_net.com" }
    password 'pass1234'
    first_name 'John'
    last_name  'Dough'
    country    'United States'
    city       'Los Angeles'
    zip_code   '90007'
    job_title  'Programmer'
    industry   'University of Southern California'
  end
end
