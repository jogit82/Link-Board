class Post < ActiveRecord::Base

	validates :title, 
	presence: true,
	length: 10..100 

	validates :link,
	presence: true,
	:format => URI::regexp(%w(http https))

  	belongs_to :user
end
