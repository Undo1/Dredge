module CommentsHelper
  def self.get_comments
    url = URI.parse("http://api.stackexchange.com/2.2/comments?order=desc&pagesize=100&sort=creation&site=stackoverflow&filter=!1zSsisQasVU2CYS0yMFPJ&key=7RCX7WGpugppxn*s4mlR6Q((")

    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }   

    existing_comments = Comment.select(:comment_id).limit(100).order("comment_id DESC").map { |c| c.comment_id }

    comments = JSON.parse(res.body)["items"]

    comments.each do |comment|
      c = Comment.new

      u = User.find_or_create_by(:user_id => comment["owner"]["user_id"])
      u.display_name = comment["owner"]["display_name"]
      u.save! if u.changed?

      c.user = u

      c.comment_id = comment["comment_id"]
      c.text = comment["body"]
      c.comment_creation_date = DateTime.strptime(comment["creation_date"].to_s,'%s')
      c.save!
    end
  end
end
