Rails.application.routes.draw do |map|
  # Map admin controllers
  
  scope "/#{Porter::config.admin_prefix}" do 
    resources :porter_users, :controller => 'porter/users', :path => :users, :only => [:index, :new, :create, :edit, :update, :show, :destroy] do
      collection do
        post :move
      end
    end
  end

end
