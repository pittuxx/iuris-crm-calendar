Iuris::Core::Engine.routes.draw do

	scope module: 'meetings' do
		get 'meetings/weekly' => 'meetings#weekly'
  	get 'meetings/monthly' => 'meetings#monthly'
		resources :meetings
	end

	namespace :admin do
		get 'meetings/weekly' => 'meetings#weekly'
		get 'meetings/monthly' => 'meetings#monthly'
		resources :meetings, only: :index
	end
end