class ChartsController < ApplicationController
  respond_to :json

  def index
    chart_type = params[:id]

    expires_in = DateTime.now - next_chart_datetime

    @chart_data = Rails.cache.fetch("#{chart_type}_chart_data", expires_in: expires_in) do
      get_chart_data(chart_type)
    end
  end

  protected

  def get_chart_data(chart)
    raise ArgumentError("Unknown chart type") unless ['singles', 'albums'].include? chart

    doc = Nokogiri::HTML(open("http://www.bbc.co.uk/radio1/chart/#{chart}/print").read)

    # Get the field names from the headings and symbolise them
    keys = doc.css('th').map {|k| k.text.downcase.to_sym }

    data = []
    doc.css('tr')[1..-1].each do |row| # First row is headers
      x = row.css('td').map {|k| k.text}
      data << Hash[ [keys, x].transpose ]
    end

    data
  end

  # The chart data only changes once a week, 7pm on a Sunday
  def next_chart_datetime
    dt = DateTime.now.change(hour: 20, minute: 0)
    if(!dt.sunday?)
      dt = dt.beginning_of_week(:sunday).next_day(7)
    end
    dt
  end

end
