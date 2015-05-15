class Api::V1::SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token,
                     if: Proc.new { |c| c.request.format == 'application/json' }

  def create
    warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
  end

  def destroy

  end

  def failure
  end
end
