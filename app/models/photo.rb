class Photo < ActiveRecord::Base
   validates :title,:content,presence: true
end
