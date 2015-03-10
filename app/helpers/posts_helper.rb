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

  def show_tag_cloud
    out = ''
    tag_cloud Post.tag_counts_on(:tags), %w(s m l) do |tag, classname|
      out << link_to(tag.name, blog_tag_path(tag.name), :class => classname)
      out << ' '
    end
    out.html_safe
  end

end
