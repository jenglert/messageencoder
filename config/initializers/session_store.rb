# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_MessageEncoder_session',
  :secret      => '85e3732bf47f2a61ca935e7751c8a88615c1baa0947d7da8cf54083b2924395fb7debb1763a7457304ba22c7cdd66fe23f753b6f514c6f9cdbb1082eceeaa525'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
