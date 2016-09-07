class Webmotors::UpdateModels
  attr_reader :uri, :webmotors_id

  def initialize(ids)
    @uri = URI(ENV['MODELS_URI'])
    @webmotors_ids = ids.map(&:to_i)
  end

  def call
    # Make request for Webmotors site

    @webmotors_ids.each do |id|
      response = Net::HTTP.post_form(uri, { marca: id })
      models_json = JSON.parse response.body

      # Itera no resultado e grava os modelos que ainda não estão persistidas
      Model.transaction do
        models_json.each do |json|
          human_name = json["Nome"].humanize
          Model.where(name: human_name, make_id: id).update_or_create(name: human_name, make_id: id)
        end
      end
    end
  end
end