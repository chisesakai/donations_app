class DonationAddress
  include ActiveModel::Model #バリデーションを使えるようにする
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :price, :user_id

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "ちがうよ〜"}
    validates :prefecture,  numericality: {other_than: 0, message:"変だよ〜〜〜"}
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: "おかしいよ〜"} #cant be blankのエラーを出したいため
  end

  def save
    donation = Donation.create(price: price, user_id: user_id)
    Adress.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, donation_id: donation.id)
  end
end