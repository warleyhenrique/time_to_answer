# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.

#App/assets
Rails.application.config.assets.precompile += %w( admins_backoffice.js admins_backoffice.css 
                                                  users_backoffice.js users_backoffice.css    )

#Vendor/assets
Rails.application.config.assets.precompile += %w( jquery-2.2.3/dist/jquery.js bootstrap-3.0.3/css/bootstrap.css
                                                  bootsrap-3.0.3/js/bootstrap.js font-awesome-4.6.3/css/font-awesome.css)

#Lib/assets
Rails.application.config.assets.precompile += %w( sb-admin-2.js asb-admin-2.css
                                                  gentelha-custom.js gentelha-custom.css )
