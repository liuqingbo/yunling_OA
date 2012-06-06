module ApplicationReceiversHelper
  def state_for_select
    result = []
    result << [I18n.t('views_application_receivers.pending'), 'pending']
    result << [I18n.t('views_application_receivers.approved'), 'approved']
    result << [I18n.t('views_application_receivers.rejected'), 'rejected']
    result
  end
end
