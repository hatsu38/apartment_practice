# WebpackerでCompileしたファイルもS3に置く
# REFS: https://github.com/AssetSync/asset_sync#webpacker--20-support
if defined?(AssetSync)
  Rake::Task['webpacker:compile'].enhance do
    Rake::Task["assets:sync"].invoke
  end
end