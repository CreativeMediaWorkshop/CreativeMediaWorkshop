RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :cmw_account
  end
  config.current_user_method(&:current_cmw_account)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model MoItem do
    edit do
      fields_of_type :tag_list do
        partial 'tag_list_with_suggestions'
      end
    end
  end

  config.model MainArticle do
    edit do
      fields_of_type :tag_list do
        partial 'tag_list_with_suggestions'
      end
    end
  end

  config.model CmwAccount do
    edit do
      field :role
    end
  end
end
