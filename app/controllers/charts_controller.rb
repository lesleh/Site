class ChartsController < ApplicationController
  respond_to :json

  def index
    chart_type = params[:id]
    @chart_data = Rails.cache.fetch("#{chart_type}_chart_data", expires_in: 1.hour, force: true) do
      get_chart_data(chart_type)
    end
  end

  protected

  # TODO sometimes the chart data is incomplete (on a sunday, when the new chart is coming up)
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

end
