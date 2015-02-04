require 'rails_helper'

describe User do
  before(:each) do
    # @user = FactoryGirl.create :user

    @user = User.new(name: "b", email: "b@b.com", password: "qwer1234", password_confirmation: "qwer1234")
  end
  it 'is expected to respond to name' do
    expect(@user).to respond_to(:name)
  end
  # it {expect(User).to respond_to(:password)}
  it { is_expected.to respond_to(:password_digest) }
  it { is_expected.to respond_to(:password) }

  subject { @user }
  it { is_expected.to respond_to(:name) }
  it { should respond_to(:email) }

  context 'MUST not be valid' do
    it 'if name is empty' do
      @user.name = "      "
      @user.save
      # @user.valid?.should == false
      expect(@user.valid?).not_to be_truthy
      expect(@user).to be_invalid
    end

    it 'if name is over 50' do
      @user.name = 'a' * 100
      @user.save
      expect(@user).to be_invalid
    end

    # it 'if email format is incorrect' do
    #   bad_emails = %w[user@foo,com user_at_something.org test+test.com]
    #   bad_emails.each do |bad_email|
    #     @user.email = bad_email
    #     expect(@user).to be_invalid
    #   end
    # end
  end

  describe '#encrypt_password' do
    it { is_expected.to respond_to(:encrypt_password) }
    it 'expect password_digest exist' do
      @user.save
      expect(@user.password_digest).not_to be_nil
    end
  end
  context 'asf' do

  end
  describe "#password_matches" do
    it { is_expected.to respond_to(:password_matches?) }
    it { expect(@user.password_matches?).to be_truthy }
    it 'expected to be false when password does not matches' do
      @user.password_confirmation = "1232133"
      expect(@user.password_matches?).to be_falsey
    end
  end


end
