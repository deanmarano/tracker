module ApplicationHelper
  def flash_class(level)
    {
      :notice => 'alert-success',
      :error  => 'alert-danger',
      :alert  => 'alert-info'
    }[level]
  end
end
