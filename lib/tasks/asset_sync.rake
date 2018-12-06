if defined?(AssetSync)
  Rake::Task['webpacker:compile'].enhance do
    puts 'Running asset_sync (yay)'
    Rake::Task['assets:sync'].invoke
  end
end
