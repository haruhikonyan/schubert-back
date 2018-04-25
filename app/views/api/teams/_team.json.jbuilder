json.extract! team, *(Team.attribute_names - ['password_digest', 'created_at', 'updated_at'])
