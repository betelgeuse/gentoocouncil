# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gentoocouncil_session',
  :secret      => '8e53cfb6312d6344443dfe37be4cc6342110cf580cfaf03aa55f247a12344352e468b5aa2b5664833ed0be7c36bd61caf7506d276b5348d57e92f5fd8e2f5ddf'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
