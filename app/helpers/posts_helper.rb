module PostsHelper

  def link_to_month_archive(date, *opts)
    link_to date.strftime("%B %Y"), blog_archive_path(date.year, '%02d' % date.month), *opts
  end

end
