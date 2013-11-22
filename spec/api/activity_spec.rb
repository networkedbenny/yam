# -*- encoding: utf-8 -*-

# Copyright (c) Microsoft Corporation
# All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# THIS CODE IS PROVIDED *AS IS* BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION ANY
# IMPLIED WARRANTIES OR CONDITIONS OF TITLE, FITNESS FOR A PARTICULAR
# PURPOSE, MERCHANTABLITY OR NON-INFRINGEMENT.
#
# See the Apache Version 2.0 License for specific language governing
# permissions and limitations under the License.

require File.expand_path('../../spec_helper', __FILE__)
require 'ostruct'

describe Yammer::Api::Activity do

  before :all do
    @client = Yammer::Client.new(
      :site_url     => 'https://yammer.com',
      :client_id     => 'PRbTcg9qjgKsp4jjpm1pw',
      :client_secret => 'Xn7kp7Ly0TCY4GtZWkmSsqGEPg10DmMADyjWkf2U',
      :access_token  => 'TolNOFka9Uls2DxahNi78A'
    )
  end

  subject { @client }

  describe '#create_activity' do
    it 'should post activity' do
      params = {
        activity: {
          actor: {
          name: 'John Doe',
          email: 'jdoe@yammer-inc.com'
          },
        action: 'create',
          object: {
            url: 'www.example.com',
            title: 'Example event name',
          }
        },
        message: 'Posting activity',
        users: [{
          name: 'Example Invitee',
          email: 'example@yammer-inc.com'
        }]
      }
      subject.should_receive(:post).with('/api/v1/activity', params)
      @client.create_activity(params)
    end
  end
end
