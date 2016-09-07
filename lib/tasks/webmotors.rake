namespace :webmotors do
  desc "Atualiza a tabela de fabricantes"
  task update_makers: :environment do
    Webmotors::UpdateMakers.new().call()
  end

  desc "Atualiza a tabela de modelos"
  task :update_models, [:ids] => :environment do |t,args|
    args.with_defaults(ids: Make.pluck(:webmotors_id))
    Webmotors::UpdateModels.new(args.ids).call()
  end

end
