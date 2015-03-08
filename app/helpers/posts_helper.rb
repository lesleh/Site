module PostsHelper
  include ActsAsTaggableOn::TagsHelper

  def link_to_month_archive(date, *opts)
    link_to date.strftime("%B %Y"), blog_archive_path(date.year, '%02d' % date.month), *opts
  end

  def tag_links(post)
    post.tags.map(&:name).map {|t| link_to t, blog_tag_path(t)}.join(', ').html_safe
  end

end
