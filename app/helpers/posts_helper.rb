module PostsHelper

  def month_archive_link_title(date)
    date.strftime("%B %Y")
  end

  def link_to_month_archive(date, *opts)
    year = date.year
    month = '%02d' % date.month
    link_to month_archive_link_title(date), {:controller => 'posts', :action => 'index', :year => year, :month => month}, *opts
  end

end
