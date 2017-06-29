class User < ApplicationRecord
  # before_save{self.email = self.email.downcase!}
  before_save{email.downcase!} #こっちの方がスマート。

  validates :name, presence:true
  validates :email, presence:true
  validates :name, presence:true, length: { maximum:50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:true, length: { maximum:255},
            format:{ with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive:false}
end
