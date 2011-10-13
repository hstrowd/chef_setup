CHEF_DIR=File.join(File.expand_path(File.dirname(__FILE__)), '..')
file_cache_path CHEF_DIR
cookbook_path [CHEF_DIR + "/cookbooks"]
log_level :debug
