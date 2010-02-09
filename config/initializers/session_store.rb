# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_mail_where_session',
  :secret => '13bcfb463dc3af0b23365ce82cfe24e69d49103f03e817d51f17d14b0dbbbe581cfdb60be6731d703a551a63ee1becc034cf74027c2156a109636c2590f6cbce'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :mem_cache_store
