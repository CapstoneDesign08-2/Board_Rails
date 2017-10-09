class Post < ApplicationRecord
  #이 부분을 작성하시오.
  validates :name,  :presence => true
  validates :title, :presence => true,
            :length => { :minimum => 5 }
end
