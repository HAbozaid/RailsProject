class Order < ActiveRecord::Base

	 include PublicActivity::Common

	 has_many :order_details, dependent: :destroy
end
