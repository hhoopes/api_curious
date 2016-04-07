class AncestryPresenter < SimpleDelegator
  attr_reader :service, :current_user

  def initialize(current_user, service)
    @service = service
    @current_user = current_user
    super(@current_user)
  end

  def ancestry_info
    info = service.ancestry
    new_hash = hash_iterate(info.first["ancestry"])
    Kernel.binding.pry
    array = new_hash.map do | k,v |
      Population.new(k, v)
    end
  end

  private

    def hash_iterate(hash)
      hash.each {|key, value|
        value.is_a?(Hash) ? hash_iterate(key, value) :
              find_populations
      }
      saved
    end
end
