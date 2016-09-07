class Webmotors::UpdateMakers
  attr_reader :uri

  def initialize
    @uri = URI(ENV['MAKERS_URI'])
  end

  def call
    # Make request for Webmotors site
    response = Net::HTTP.post_form(@uri, {})
    json = JSON.parse response.body
    
    # Itera no resultado e grava as marcas que ainda não estão persistidas
    Make.transaction do
      json.each do |make_params|
        human_name = make_params["Nome"].humanize
        next if human_name == ""
        Make.where(name: human_name).update_or_create(name: human_name, webmotors_id: make_params["Id"])
      end
    end
  end
end