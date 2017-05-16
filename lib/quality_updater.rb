class QualityUpdater
  public
  attr_reader :item

  def initializer()
    @item  = nil
  end

  def set_item(new_item)
    self.item = new_item
  end
  
  private
  attr_writer :item
end
