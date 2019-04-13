# frozen_string_literal: true

require "sinatra"

set :bind, "0.0.0.0"
set :port, 8000

post "/deploy" do
  return "Unauthorized" if params[:key] != ENV["SLACK_WEBHOOK_KEY"]

  environment = params[:command].to_s.scan(/deploy-(.+)/).flatten.first
  args = params[:text].to_s.split
  web = args.select { |arg| arg =~ %r{web/} }.first || "web/master"
  server = args.select { |arg| arg =~ %r{server/} }.first || "server/master"

  web_branch = web.split("/").last
  server_branch = server.split("/").last

  pid = spawn <<-SHELL
  cd ../server
  bin/deploy -s #{server_branch} -w #{web_branch}
  SHELL

  Process.detach(pid)

  "Initializing deployment of #{web} and #{server} to #{environment}."
end
