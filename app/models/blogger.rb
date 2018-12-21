class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :bio, length: { minimum: 20}
  validates :name, uniqueness: true
  validate :age_limit


  def age_limit
    if self.age <= 0
      errors.add(:age, "Not a valid age!")
    end
  end
  #
  # def most_likes
  #   likes = self.posts.map { |post| post.likes}
  #   if !likes == 0 || nil
  #   most_likes_sort = self.posts.sort { |a,b| a.likes <=> b.likes }
  #   most_likes_sort.last
  #   end
  # end





  def destinations_hash
    dest_hash = {}
    destination_sort[0..4].map do |post|
      dest_hash[post.name] = post.country
    end
    dest_hash
  end


end
