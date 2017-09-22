require 'rails_helper'

RSpec.describe User, type: :model do
  # let so cria o obj quando e chamado
  # let! cria antes

  let(:user) { build :user }

  it { is_expected.to respond_to :email }
  it { is_expected.to respond_to :password }
  it { is_expected.to respond_to :password_confirmation }

  it { is_expected.to be_valid }

  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_confirmation_of :password }
  it { is_expected.to validate_uniqueness_of :auth_token }

  describe '#info' do
    it 'returns email, created_at and a token' do
      user.save!

      expect(user.info).to eq("#{user.email} - #{user.created_at} - #{}")
    end
  end
end
