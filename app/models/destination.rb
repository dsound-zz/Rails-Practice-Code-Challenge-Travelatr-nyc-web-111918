class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def name_country
    "#{self.name}, #{self.country}"
  end

  def last_five
    self.posts.last(5)
  end

  def most_likes
    most_likes_sort = self.posts.sort { |a,b| a.likes <=> b.likes }
    most_likes_sort.map { |sort| sort.title }
  end


  def blogger_avg_age
    blogger_age = self.posts.map do |post|
      post.blogger.age
    end
    if !blogger_age == 0
    blogger_age.inject(:+) / blogger_age.size
    end
  end

end
