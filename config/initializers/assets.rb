# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Bower assets
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'components')

# Lightbox images
Rails.application.config.assets.precompile += %w( lightbox2/img/*.gif lightbox2/img/*.png )

# FontAwesome fonts
Rails.application.config.assets.precompile += %w( fontawesome/fonts/* )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
