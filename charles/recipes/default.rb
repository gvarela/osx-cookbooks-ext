#
# Cookbook Name:: charles
# Recipe:: default
#
# Copyright 2011, Factory Design Labs
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

application 'Charles' do
  source 'http://www.charlesproxy.com/assets//release/3.5.2/charles_macosx.zip'
end
