class Webmotors::UpdateModels
  attr_reader :uri, :webmotors_id

  def initialize(ids)
    @uri = URI(ENV['MODELS_URI'])
    @maker_ids = ids.map(&:to_i)
  end

  def call
    # Make request for Webmotors site

    Make.where(id: @maker_ids).each do |maker|
      response = Net::HTTP.post_form(uri, { marca: maker.webmotors_id })
      models_json = JSON.parse response.body

      # Itera no resultado e grava os modelos que ainda não estão persistidas
      Model.transaction do
        models_json.each do |json|
          human_name = json["Nome"].humanize
          Model.where(name: human_name, make_id: maker.id).update_or_create(name: human_name, make_id: maker.id)
        end
      end
    end
    Model.count
  end
end