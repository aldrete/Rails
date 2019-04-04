Rails.application.routes.draw do



  root to: 'pages#home'

  devise_for :users , :controllers => {registrations: 'registrations'}
  resources :companies
  resources :employees
  mount Companies::CompaniesAPI => '/api/companies'
  mount Employees::EmployeesAPI => '/api/employees'

  get 'companies/' , to: 'companies#index' ,as: 'companies_index'

  get 'companies/:id/show' , to: 'companies#show' , as: 'show'

  get 'companies/new' , to: 'companies#new' , as: 'new'

  post 'companies/' , to: 'companies#create' , as: 'create'

  get 'companies/:id/edit' ,to: 'companies#edit', as: 'edit'

  put 'companies/:id/update' ,to: 'companies#update', as: 'update'

  delete 'companies/:id' ,to: 'companies#destroy', as: 'destroy'


  get 'employees/' ,to: 'employees#index' ,as: 'employees_index'

  get 'employees/:id/show' , to: 'employees#show' , as: 'emp_show'

  get 'employees/new' , to: 'employees#new' , as: 'emp_new'

  post 'employees/' , to: 'employees#create' , as: 'emp_create'

  get 'employees/:id/edit' ,to: 'employees#edit', as: 'emp_edit'

  put 'employees/:id/update' ,to: 'employees#update', as: 'emp_update'

  delete 'employees/:id' ,to: 'employees#destroy', as: 'emp_destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
