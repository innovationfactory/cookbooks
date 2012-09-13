include_recipe "rbenv"
include_recipe "rbenv::ruby_build"

rbenv_ruby node.bluepill.ruby_1_9_2_version
