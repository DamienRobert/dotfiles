#$ yardoc; rdoc -o rdoc
class Ploumifie
  # Ploumifie
  # @param s [#to_s] the ploumified
  # @return [String] the ploum
  def ploum(s)
    return s+"ploum"
  end

  # (see #ploum)
  # @note plam is better than ploum!
  def plam(s)
    return s+"plam"
  end

  # @see #ploum
  def plum(s)
    return s+"plam"
  end

  # The plim method is nice
  #
  # ## Plim
  # Plimifie
  #
  # Plimplim
  # =======
  #
  # Plimifie encore plus
  # @param s [Array<String,Symbol>,String,nil,#to_s] the plimified
  # @return (see #ploum)
  def plim(s)
    return s+"plam"
  end

  #the foo reader
  #we can link this way: see for instance {#bar}
  attr_reader :foo

  # the bar accessor
  # with a longer description
  # which is in markdown
  #
  # - and
  # - a
  # - list
  #
  # ## and a title
  attr_accessor :bar

  # @param [Hash] opts the options to create a message with.
  # @option opts [String] :subject The subject
  # @option opts [String] :from ('nobody') From address
  # @option opts [String] :to Recipient email
  # @option opts [String] :body ('') The email's body
  def thing_with_option(*opts)
  end

  # @param [String] user the username for the operation
  # @param [String] host the host that this user is associated with
  # @param [Time] time the time that this operation took place
  def clean(user, host, time = Time.now) end

  # @param (see #clean)
  # @example
  #  activate("dams","Feanor")
  def activate(user, host, time = Time.now) end

  # For a block {|a,b,c| ... }
  # @yield [a, b, c] Gives 3 random numbers to the block
  def provide3values(&block) yield(42, 42, 42) end

  # @yieldparam [String] name the name that is yielded
  def with_name(name) yield(name) end

  # @yieldreturn [Fixnum] the number to add 5 to.
  def add5_block(&block) 5 + yield end

  # @!group Callbacks

  def before_filter; end
  def after_filter; end

  # @!endgroup

end
