class CmwAccount < ActiveRecord::Base
  # ROLES = ['admin', 'user', 'verified', 'banned']
  validates :name, uniqueness: true
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  after_create :additional_configuration
  def additional_configuration
    $PIOclient.create_user(id)
  end

  #support for types and other attributions not implemented
  def item_recommendation(number)
    $PIOclient.identify(id)
    begin
      $PIOclient.get_itemrec_top_n('MoViewRecEngine', number)
    rescue PredictionIO::Client::ItemRecNotFoundError => e
    end
  end
end
