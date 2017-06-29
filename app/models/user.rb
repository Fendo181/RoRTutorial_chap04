class User < ApplicationRecord
  #name属性の存在を検証する。
  validates :name, presence:true
end
