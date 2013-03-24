require 'active_support'

if defined? Rails
  require "activerecord-postgres-uuid-primary/railties"
else
  ActiveSupport.on_load :active_record do
    require "activerecord-postgres-uuid-primary/activerecord"
  end
end
