class Offsets

  def generate_offset
    date = Time.now.strftime("%d%m%y").to_i
    squared = date ** 2
    squared.to_s[-4..-1]
  end

end
