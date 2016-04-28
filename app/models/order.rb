class Order < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :user
 include PublicActivity::Common

  has_many :inviteds,  :dependent => :destroy  
  has_many :users, :through => :inviteds
  enum orderchose: [:BreakFast, :Lunch]
  mount_uploader :menu_image, ImageUploader
 
 validates :from, presence: true ,format:{with: /\A(\w+\s?)*\s*\z/, message: ' Restaurant name can only have letters and numbers only one space between words' }
=======

	 include PublicActivity::Common
>>>>>>> refs/remotes/origin/master

	 has_many :order_details, dependent: :destroy
end
