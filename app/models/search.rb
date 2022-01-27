class Search < ApplicationRecord
  validates :do_you_have_a_trn, presence: true, on: :find_your_trn
  validates :name, presence: { message: "Enter your name" }, on: :what_is_your_name
  validates :date_of_birth, presence: { message: "Enter your date of birth" }, on: :what_is_your_date_of_birth
  validates :email, presence: { message: "Enter your email address" }, on: :where_should_we_send_your_trn
end
