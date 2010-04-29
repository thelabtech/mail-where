# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
Rails.application.config.session_store :mem_cache_store, :key    => '_mail_where_session'
Rails.application.config.secret_token = 'a9aa8b960b1186dd0bc248df109102992979645457f2517d3a7a08db8fc7cd78fe16fec2d33badf73221124441ae38b8118de43496a67b607408deff3bb181d7'