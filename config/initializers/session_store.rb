# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rumble_session',
  :secret      => '4ae45e305be269cb517007dd7c373442138d98473524bf20dd3e147bb9f0f48ba4d030f07a1b086cabc5a11a08d5353a7de4f370a31f6d9d801e5a91ba904a49'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
