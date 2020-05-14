require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#user table columns' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :first_name }
    it { is_expected.to have_db_column :last_name }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
    it { is_expected.to have_db_column :password }
    it { is_expected.to have_db_column :password_confirmation }
    it { is_expected.to have_db_column :role}
  end
  describe '#user attributes validation' do
    subject { create(:user)}
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:first_name) }
    it {is_expected.to validate_presence_of(:last_name)}
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_confirmation_of(:password) }
    context 'should not be invalid email address' do
      emails = ['ppp@ qr.com', '@example.com', 'trial test @gmail.com',
                'linda@podii', 'yyy@.x. .x', 'zzz@.z']
      emails.each do |email|
        it { is_expected.not_to allow_value(email).for(:email) }
      end
    end
    context 'should allow valid email address' do
      emails = ['flower@fl.com', 'helloworld@example.ke', 'trialbait@goosepump.de',
                'okothkkk@gmail.com', 'janedoe@originals.ze']
      emails.each do |email|
        it { is_expected.to allow_value(email).for(:email) }
      end
    end
    context 'should not be invalid passwords' do
      passwords = ['Pass@12', 'CAPITAL LONGER', 'smallstrongerandbetter',
                   '***@###22', 'smallandsymbols#$%', 'mixtureNOSymbols1234']
      passwords.each do |password|
        it { is_expected.not_to allow_value(password).for(:password) }
      end
    end
    context 'should  be invalid passwords' do
      passwords = ['Password@12', 'CAPITAL LONGERsmall123.', 'stronger(andbe0tterCAP',
                   '***@###22jackBuer', 'mixtureNO#Symbols1234']
      passwords.each do |password|
        it { is_expected.to allow_value(password).for(:password) }
      end
    end
    context 'should  allow valid first name' do
      first_name = ['Jane', 'J', 'jane',
                   'JANE' * 7, "Kong'o"]
      first_name.each do |first_name|
        it { is_expected.to allow_value(first_name).for(:first_name) }
      end
    end
    context 'should not  be invalid first name' do
      first_name = ['Jane1','1jane',
                   'JANE' * 10, "Ko2ng'o"]
      first_name.each do |first_name|
        it { is_expected.not_to allow_value(first_name).for(:first_name) }
      end
    end
    context 'should  allow valid last name' do
      last_name = ['Jane', 'J', 'jane',
                   'JANE' * 7, "Kooong'o"]
      last_name.each do |last_name|
        it { is_expected.to allow_value(last_name).for(:last_name) }
      end
    end
    context 'should not  be invalid last name' do
      last_name = ['Jane1', '1jane',
                   'JA  NE' * 30, "Ko2 5ng'o"]
      last_name.each do |_lastt_name|
        it { is_expected.not_to allow_value(last_name).for(:last_name) }
      end
    end
  end

  describe '#user creation' do
    it 'creates normal  user with valid attributes' do
      expect(create(:user).user?).to be_truthy
    end
  describe 'user association' do
    it { is_expected.to have_many(:advertisements) }
  end
    it ' expects user  with wrong format email to be invalid' do
      expect(build(:user, email: 'email@g')).to_not be_valid
    end
    it 'it should not allow user with wrong format email to be created' do
      user = build(:user, email: 'email@g')  
      user.save 
      expect(user.errors.messages[:email]).to_not be_blank
    end
    it 'sends a confirmation email' do
      user = build :user, confirmed_at: ''
      expect { user.save }.to change(ActionMailer::Base.deliveries, :count).by(1)
    end
    it 'it should not allow user with exist email to be created' do
      create(:user, email: 'janedoe@example.com')
      user = build(:user, email: 'JANEDOE@example.com')  
      user.save     
      expect(user.errors.messages[:email]).to eq ['has already been taken']
    end
    it 'it should not allow user with weak password to be created' do
      pass_error = 'Atleast 8 characters, 1 lower-case,1 upcase,1 symbol and a digit'
      user = build(:user, password: 'password1.', password_confirmation: 'password1.')  
      user.save      
      expect(user.errors.messages[:password]).to eq [pass_error]
    end
    it 'it should not allow user with mistaching passwords to be created' do      
      user = build(:user, password: 'Vertrong.23', password_confirmation: 'PAword12!')  
      user.save     
      expect(user.errors.messages[:password_confirmation]).to eq ["doesn't match Password"]
    end
    it 'it should not allow user with first name with numeric to be created' do      
      user = build(:user, first_name: 'rubo1cop')  
      user.save         
      expect(user.errors.messages[:first_name]).to eq ['format is invalid']
    end
    it 'it should not allow user with first name of length greater than 30 to be created' do      
      user = build(:user, first_name: 'rubo1cop' * 8)  
      user.save      
      expect(user.errors.messages[:first_name]).to eq ['format is invalid']
    end
    it 'it should not allow user with last name with numeric to be created' do      
      user = build(:user, last_name: 'rubo1cop')  
      user.save         
      expect(user.errors.messages[:last_name]).to eq ['format is invalid']
    end
    it 'it should not allow user with last name of length greater than 30 to be created' do      
      user = build(:user, last_name: 'rubo1cop' * 8)  
      user.save    
      expect(user.errors.messages[:last_name]).to eq ['format is invalid']
    end
    it 'display one error at time' do      
      user = build(:user, first_name: '')  
      user.save  
      expect(user.errors.messages[:first_name]).to eq ["can't be blank"]   
      expect(user.errors.messages[:first_name]).not_to eq ["can't be blank", 'format is invalid']
    end
    it 'creates user with default role as normal' do      
      expect(create(:admin).admin?).to be_truthy
    end
  end

end
