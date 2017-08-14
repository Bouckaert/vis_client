require 'mongoid/version' # Needed because of ruby and mongoid version

require 'vis_client/version'

require 'vis_client/representers/notification_representer'

require 'vis_client/errors'
require 'vis_client/config'
require 'vis_client/adapter'
require 'vis_client/notification'
require 'vis_client/notification_builder'
require 'vis_client/job'
require 'vis_client/queue'
require 'vis_client/notifier'
require 'vis_client/notifier_builder'
require 'vis_client/notifier_builder_job'

module VisClient

  def self.configure(&block)
    yield(config) if block_given?
  end

  def self.config
    @config ||= Config.new
  end

  def self.notify_delayed(resource, type, args)
    config.logger.debug 'entrou notify ------------------------------------'
    elements = args.respond_to?(:map) ? args : [args]
    notifier_builder = NotifierBuilder.new(resource, type, elements)
    notifier_builder.build
  end

end
