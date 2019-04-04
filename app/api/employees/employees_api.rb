module Employees   
    class EmployeesAPI < Grape::API   
     
      format :json   
     
    desc "Employee List", {   
        :notes => <<-NOTE
        get All Employeees
        _________________
        NOTE
    }
     
      get do   
        Employee.all   
         end
      
      desc "Employee by Id", {   
        :notes => <<-NOTE
        get Employee by Id
        _________________
        NOTE
    }

    params do   
        requires :id, type: Integer, desc: "Employee id"   
        end

    get ':id' do   
        begin   
          employee = Employee.find(params[:id])   
        rescue ActiveRecord::RecordNotFound   
          error!({ status: :not_found }, 404)   
        end   
    end

    desc "Delete Employee by Id", {   
        :notes => <<-NOTE
        Delete Employee by Id
        _________________
        NOTE
    }
    params do   
        requires :id, type: Integer, desc: "Employee id"   
    end
    
    delete ':id' do   
        begin   
          employee = Employee.find(params[:id])   
          { status: :success } if employee.delete   
        rescue ActiveRecord::RecordNotFound   
          error!({ status: :error, message: :not_found }, 404)   
        end   
    end
    

    desc "Update Employee by Id", {   
        :notes => <<-NOTE
        Update Employee by Id
        _________________
        NOTE
    }

    params do   
        requires :id, type: Integer, desc: "Employee id"   
        requires :name, type: String, desc: "Employee name"
        requires :rfc, type: String, desc: "Employee rfc"
        requires :position, type: String, desc: "Employee position"
    end   

    put ':id' do   
        begin   
          employee = Employee.find(params[:id])   
          if employee.update({   
                                name: params[:name],   
                                rfc: params[:rfc],   
                                position: params[:position],   
                                  
                            })   
            { status: :success }   
          else   
            error!({ status: :error, message: employee.errors.full_messages.first }) if employee.errors.any?   
          end 
        rescue ActiveRecord::RecordNotFound   
        error!({ status: :error, message: :not_found }, 404)   
        end   
    end

    
    desc "Employee Company", {   
        :notes => <<-NOTE
         Create Employee
        _________________
        NOTE
    }

    params do   
        requires :id, type: Integer, desc: "Employee id"   
        requires :name, type: String, desc: "Employee name"
        requires :rfc, type: String, desc: "Employee rfc"
        requires :position, type: String, desc: "Employee position"
    end
    
    post do   
        begin   
          employee =  Employee.create({
                                         name: params[:name],   
                                         rfc: params[:rfc],   
                                         position: params[:position],     
                                          
                                    })   
          if employee.save   
            { status: :success }   
          else   
            error!({ status: :error, message: employee.errors.full_messages.first }) if employee.errors.any?   
          end
        rescue ActiveRecord::RecordNotFound   
            error!({ status: :error, message: :not_found }, 404)   
          end   
        end
    end
end 
  
    
   



    
