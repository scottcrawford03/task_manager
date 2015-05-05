Rails.application.routes.draw do
   root 'tasks#index'
   resources :task_list do
    resources :tasks
   end
   resources :archive_task_list
   resources :delete_task, only: [:destroy]
   resources :complete_task, only: [:update]
end
