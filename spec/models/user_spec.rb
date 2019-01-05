# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it "is invalid without an email address" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    create(:user, email: "tom@example.com")
    user = build(:user, email: "tom@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
