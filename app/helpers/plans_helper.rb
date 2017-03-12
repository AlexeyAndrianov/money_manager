module PlansHelper
  def bootstrap_status(plan_status)
    if plan_status == 'active'
      'success'
    else
      'primary'
    end
  end
end
