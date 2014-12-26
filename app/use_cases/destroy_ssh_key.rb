class DestroySshKey
  unloadable

  include UseCaseBase

  attr_reader :ssh_key
  attr_reader :options


  def initialize(ssh_key, opts = {})
    @ssh_key = ssh_key
    @options = opts
    super
  end


  def call
    destroy_ssh_key
    super
  end


  private


    def destroy_ssh_key
      logger.info("User '#{User.current.login}' has deleted a SSH key")
      resync_gitolite(:delete_ssh_key, ssh_key.to_yaml, options)
    end

end
