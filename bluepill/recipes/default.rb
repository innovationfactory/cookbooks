#
# Cookbook Name:: bluepill
# Recipe:: default
#
# Copyright 2010, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "bluepill::ruby_1_9_2"

%w(i18n bluepill).each do |gp|
  rbenv_gem gp do
    ruby_version node["bluepill"]["ruby_1_9_2_version"]
  end
end

[
  node["bluepill"]["conf_dir"],
  node["bluepill"]["pid_dir"],
  node["bluepill"]["state_dir"]
].each do |dir|
  directory dir do
    recursive true
    owner "root"
    group node["bluepill"]["group"]
  end
end
