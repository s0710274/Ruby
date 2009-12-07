# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_antra_ruby_session',
  :secret      => 'cf9276b77ad897f6d7b95d0aa1135af20a0ae9ad9e69e08de0c4ab506001f1edd8693dd86ae3ebcae21c0ef6a991649d819971ab2764fe4b3691b84f085dc497'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
