require 'aws-sdk-s3'
require 'pry'
require 'securerandom'

bucket_name = ENV['BUCKET_NAME']
puts bucket_name

# I will skip the ruby as i do not want to was install MSYS and waste time but I will include link to exampro's version as reference below
#https://github.com/ExamProCo/AWS-Examples/tree/main/s3/sdk/ruby