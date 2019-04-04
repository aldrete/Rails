module Companies   
    class CompaniesAPI < Grape::API   
     
      format :json   
     
    desc "Company List", {   
        :notes => <<-NOTE
        get All Companies
        _________________
        NOTE
    }
     
      get do   
        Company.all   
         end
      
      desc "Company by Id", {   
        :notes => <<-NOTE
        get Company by Id
        _________________
        NOTE
    }

    params do   
        requires :id, type: Integer, desc: "Company id"   
        end

    get ':id' do   
        begin   
          company = Company.find(params[:id])   
        rescue ActiveRecord::RecordNotFound   
          error!({ status: :not_found }, 404)   
        end   
    end

    desc "Delete Company by Id", {   
        :notes => <<-NOTE
        Delete Company by Id
        _________________
        NOTE
    }
    params do   
        requires :id, type: Integer, desc: "Company id"   
    end
    
    delete ':id' do   
        begin   
          company = Company.find(params[:id])   
          { status: :success } if company.delete   
        rescue ActiveRecord::RecordNotFound   
          error!({ status: :error, message: :not_found }, 404)   
        end   
    end
    

    desc "Update Company by Id", {   
        :notes => <<-NOTE
        Update Company by Id
        _________________
        NOTE
    }

    params do   
        requires :id, type: Integer, desc: "Company id"   
        requires :company_name, type: String, desc: "Company name"
        requires :street_name, type: String, desc: "Company street_name"
        requires :Colony_name, type: String, desc: "Company Colony_name"
        requires :ext_num, type: Integer, desc: "Company ext_num"
        requires :int_num, type: Integer, desc: "Company int_num"
        requires :zip_code, type: Integer, desc: "Company zip_code"
        requires :city, type: String, desc: "Company city"
        requires :country, type: String, desc: "Company country"
    end   

    put ':id' do   
        begin   
          company = Company.find(params[:id])   
          if company.update({   
                                company_name: params[:company_name],   
                                street_name: params[:street_name],   
                                Colony_name: params[:Colony_name],   
                                ext_num: params[:ext_num],
                                int_num: params[:int_num],
                                zip_code: params[:zip_code],
                                city: params[:city],
                                country: params[:country],

                                  
                            })   
            { status: :success }   
          else   
            error!({ status: :error, message: company.errors.full_messages.first }) if company.errors.any?   
          end 
        rescue ActiveRecord::RecordNotFound   
        error!({ status: :error, message: :not_found }, 404)   
        end   
    end

    
    desc "Create Company", {   
        :notes => <<-NOTE
         Create Company
        _________________
        NOTE
    }

    params do   
        requires :id, type: Integer, desc: "Company id"   
        requires :company_name, type: String, desc: "Company name"
        requires :street_name, type: String, desc: "Company street_name"
        requires :Colony_name, type: String, desc: "Company Colony_name"
        requires :ext_num, type: Integer, desc: "Company ext_num"
        requires :int_num, type: Integer, desc: "Company int_num"
        requires :zip_code, type: Integer, desc: "Company zip_code"
        requires :city, type: String, desc: "Company city"
        requires :country, type: String, desc: "Company country"
    end
    
    post do   
        begin   
          company =  Company.create({
                                         company_name: params[:company_name],   
                                         street_name: params[:street_name],   
                                         Colony_name: params[:Colony_name],   
                                         ext_num: params[:ext_num],
                                         int_num: params[:int_num],
                                         zip_code: params[:zip_code],
                                         city: params[:city],
                                         country: params[:country],   
                                          
                                    })   
          if company.save   
            { status: :success }   
          else   
            error!({ status: :error, message: company.errors.full_messages.first }) if company.errors.any?   
          end
        rescue ActiveRecord::RecordNotFound   
            error!({ status: :error, message: :not_found }, 404)   
          end   
        end
    end
end 
  
    
   



    
