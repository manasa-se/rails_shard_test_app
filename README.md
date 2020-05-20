# README

This example app is setup to support horizontal sharding with mysql (https://github.com/manasa-se/rails_shard_test_app/blob/master/config/database.yml#L20). 

There is an issue specifically with rolling back the database when mysql is used and the ApplicationRecord model is setup to connect to shards (https://github.com/manasa-se/rails_shard_test_app/blob/master/app/models/application_record.rb).
On issuing `rails db:rollback:primary_shard_one`, it still connects to `primary` and rolls back the migration in the `primary` database. This issue does not occur when using sqlite. It also can be circumvented by using a new abstract class and defining the connections there instead of in ApplicationRecord. 

Steps to reproduce -- 

1) `rails db:migrate`
2) `rails db:rollback:primary_shard_one`
3) `rails db:rollback:primary`

Step 3 will not show any output as Step 2 has rolled back primary already.
