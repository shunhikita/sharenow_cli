require 'thor'
require 'mime/types'
require 'faraday'
require 'json'

module SharenowCli
  class CLI < Thor

    BASE_URL = 'https://www.share-now.me'.freeze

    SharenowError = Class.new(StandardError)

    desc "push {target_file_paths}", "upload the {target_file_paths} to share-now.me. "
    option :title, type: :string, desc: 'set file content title', aliases: '-t'
    option :desc, type: :string, desc: 'set file content description', aliases: '-d'
    option :delete_limit, type: :string, desc: 'set file content description', aliases: '-l'
    def push(target_file_paths)
      raise SharenowError.new('API token is not set in ENV["SHARENOW_API_TOKEN"] variable') if ENV['SHARENOW_API_TOKEN'].nil?

      title, desc, delete_limit = options[:title], options[:desc], options[:delete_limit]

      target_file_paths = target_file_paths.split(' ')

      raise SharenowError.new('The correct file path is not specified') if target_file_paths.size == 0

      upload_files = target_file_paths.inject([]) do |upload_files, file_path|
        file_paths = Dir.glob(file_path)

        raise SharenowError.new('Directory is not supported') if file_paths.find{|file| FileTest.directory?(file) }

        upload_ios = file_paths.map do |file_path|
          content_type = MIME::Types.type_for(file_path).first.to_s || 'application/oct-stream'
          Faraday::UploadIO.new(file_path,  content_type)
        end
        upload_files.concat(upload_ios).uniq
      end

      res = faraday_multipart_conn("#{BASE_URL}/api/v1/contents").post do |req|
        req.body = body_params(title, desc, delete_limit, upload_files)
      end

      if res.status == 201
        res_body =  JSON.parse(res.body)
        puts res_body['shared_link']
      elsif res.status == 400
        puts JSON.parse(res.body).join("\n")
      else
        puts res.body
      end
    end

    private

      def faraday_multipart_conn(url)
        Faraday.new(url) do |conn|
          conn.token_auth "#{ENV['SHARENOW_API_TOKEN']}"
          conn.request :multipart
          conn.request :url_encoded
          conn.adapter :net_http
        end
      end

      def body_params(title, desc, delete_limit, files)
        params = {content: {}}
        params[:content][:title] = title unless title.nil?
        params[:content][:description] = desc unless desc.nil?
        params[:content][:delete_limit] = delete_limit.to_i unless delete_limit.nil?
        params[:content][:files] = files
        params
      end

  end
end