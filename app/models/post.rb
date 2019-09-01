class Post < ApplicationRecord
    belongs_to :user
    validates :title, presence: true 
    validates :subs, presence: { message: "Must have at least one sub."}

    has_many :post_subs, inverse_of: :post, dependent: :destroy
    has_many :subs, through: :post_subs, source: :sub

    has_many :comments, inverse_of: :post

    belongs_to :author, 
        class_name: :User,
        foreign_key: :user_id,
        inverse_of: :posts
end