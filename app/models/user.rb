class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#deviseで利用する機能一覧。(devise作成時自動的に定義)
         
  has_many :books, dependent: :destroy
  has_many :post_comments, dependent: :destroy
end
