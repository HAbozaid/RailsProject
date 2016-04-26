class Order < ActiveRecord::Base
	 has_many :order_details, dependent: :destroy
	 validates :title, presence: true,
                    length: { minimum: 5 }
end
