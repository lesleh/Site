module PostsHelper
  include ActsAsTaggableOn::TagsHelper

  def url_for_month_archive(date, *opts)
    url_for blog_archive_path(date.year, '%02d' % date.month), *opts
  end

  def post_months
    Post.months.reverse.map do |k|
      k[:title] = k[:date].strftime("%B %Y")
      k
    end
  end

  def tag_links(post)
    post.tags.map(&:name).map {|t| link_to t, blog_tag_path(t)}.join(', ').html_safe
  end

end
