# TODO team のデータを含むようにする
json.extract! recruit, *(Recruit.attribute_names - ['created_at', 'updated_at'])
