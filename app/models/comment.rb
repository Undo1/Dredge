class Comment < ActiveRecord::Base
  has_and_belongs_to_many :domains
  has_and_belongs_to_many :links
  belongs_to :user

  before_save do
    if self.text
      self.links = URI.extract(self.text, ["http", "https"]).map {|l| Link.find_or_create_by(link: l) }

      self.domains = []

      self.links.each do |link|
        puts link.link
        uri = URI.parse(link.link)
        if uri.present?
          d = Domain.find_or_create_by(domain: uri.host)
          self.domains << d
        end
      end
    end
  end

  def link_on_site
    return "//stackoverflow.com/posts/comments/#{self.comment_id}"
  end
end
